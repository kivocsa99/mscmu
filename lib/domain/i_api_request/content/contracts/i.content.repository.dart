import 'package:dartz/dartz.dart';
import '../../failures/api.failures.dart';
import '../../../models/contentmodel.dart';

abstract class IContentRepository{
      Future<Either<ApiFailures, ContentModel>> getcontent(int id);

}