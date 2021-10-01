import 'package:dartz/dartz.dart';
import '../../failures/api.failures.dart';

import '../../../models/coursemodel.dart';

abstract class ICoursesRepository {
    Future<Either<ApiFailures, List<CourseModel>>> activeCourses(int yearId);
   Future<Either<ApiFailures, List<CourseModel>>> archiveCourses(int yearId);


}
