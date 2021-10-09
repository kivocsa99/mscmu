import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/models/newsmodel.dart';
import '../../../domain/news/contracts/i.news.repository.dart';

class NewsRepository implements INewsRepository {
  final _firestore = FirebaseFirestore.instance;
  static const newscollection = "news";
  @override
  Stream<NewsModel> get newsStream {
    final docRef =
        _firestore.collection(newscollection).doc("HbwtVkG93CxfJdugaRsg");
    final snapshots = docRef.snapshots();
    return snapshots.map((current) => NewsModel.fromJson(current.data()!));
  }
}
