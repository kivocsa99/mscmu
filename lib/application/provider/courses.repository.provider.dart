import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/i_api_request/failures/api.failures.dart';
import '../../domain/i_api_request/courses/contracts/i.courses.repository.dart';
import '../../domain/models/coursemodel.dart';
import '../../infrastructure/api_repository/courses/services/course.repository.dart';

final coursesRepositoryProvider =
    Provider<ICoursesRepository>((ref) => CourseRepository());
final activeCourseProvider = FutureProvider.autoDispose
    .family<Either<ApiFailures, List<CourseModel>>, int>((ref, yearId) async {
  final _courseRepository = ref.watch(coursesRepositoryProvider);
  return await _courseRepository.activeCourses(yearId);
});
final archiveCourseProvider = FutureProvider.autoDispose
    .family<Either<ApiFailures, List<CourseModel>>, int>((ref, yearId) async {
  final _courseRepository = ref.watch(coursesRepositoryProvider);
  return await _courseRepository.archiveCourses(yearId);
});
