import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mscmu/domain/admin/failures/user.failures.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/models/newsmodel.dart';
import '../../../domain/news/contracts/i.news.repository.dart';

class NewsRepository implements INewsRepository {
  final _firestore = FirebaseFirestore.instance;
  static const newscollection = "news";
  @override
  Stream<List<NewsModel>> get newsStream {
    final docRef = _firestore.collection(newscollection);
    final snapshots = docRef.snapshots();
    return snapshots.map((current) => current.docs
        .map(
          (e) => NewsModel.fromJson(
            e.data(),
          ),
        )
        .toList());
  }

  @override
  Future<Either<UserFailures, Unit>> addNews(
      {String? title, String? picture, String? url}) async {
    try {
      _firestore.collection(newscollection).doc().set({
        "title": title,
        "url": url,
        "picture": picture,
      });

      return right(unit);
    } catch (e) {
      return left(const UserFailures.serverError());
    }
  }
}
