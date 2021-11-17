import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/admin/failures/user.failures.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/models/postmodel.dart';
import '../../../domain/posts/contracts/i.posts.repository.dart';

class PostsRepository implements IPostsRepository {
  final _firestore = FirebaseFirestore.instance;
  static const String collection = "posts";
  @override
  Stream<List<PostModel>> classPosts(int yearid) {
    return _firestore
        .collection(collection)
        .where("yearid", isEqualTo: yearid)
        .orderBy("time", descending: true)
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (e) => PostModel.fromJson(
                  e.data(),
                ),
              )
              .toList(),
        );
  }

  @override
  Future<Either<UserFailures, Unit>> addItem(
      {String? title,
      String? adminname,
      String? adminavatar,
      String? image,
      String? body,
      int? yearid}) async {
    try {
      var uid = Uuid().v4();
      _firestore.collection(collection).doc(uid).set({
        "id":uid,
        "title": title,
        "body": body,
        "time": Timestamp.fromDate(DateTime.now()),
        "adminavatar": adminavatar,
        "adminname": adminname,
        "image": image,
        "yearid": yearid,
      });
      _firestore.collection("notifications").doc().set({
        "title": "$adminname has added a post",
        "yearid": yearid,
      });

      return right(unit);
    } catch (e) {
      return left(const UserFailures.serverError());
    }
  }

  @override
  Future<Either<UserFailures, Unit>> addNotification(
      {String? title, int? yearid}) async {
    try {
      _firestore.collection("notifications").doc().set({
        "title": title,
        "yearid": yearid,
      });

      return right(unit);
    } catch (e) {
      return left(const UserFailures.serverError());
    }
  }

  @override
  Future<Either<UserFailures, Unit>> editPost({String? id,String? title, String? body})async {
   try{
     _firestore.collection(collection).doc(id).update({
       "title":title,
       "body":body
     });
         return right(unit);
   }catch(e){return left(const UserFailures.serverError());}
  }

  @override
  Future<Either<UserFailures, Unit>> delete({String? id})async {
    try{
      _firestore.collection(collection).doc(id).delete();
      return right(unit);
    }catch(e){return left(const UserFailures.serverError());}
  }
}
