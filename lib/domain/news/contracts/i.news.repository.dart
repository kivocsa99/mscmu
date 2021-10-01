
import '../../models/newsmodel.dart';

abstract class INewsRepository {
  Stream<NewsModel> get newsStream;

}
