import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../domain/i_api_request/failures/api.failures.dart';
import '../../../../domain/i_api_request/courses/contracts/i.courses.repository.dart';
import '../../../../domain/models/coursemodel.dart';
import 'package:http/http.dart' as http;

class CourseRepository implements ICoursesRepository {
  @override
  Future<Either<ApiFailures, List<CourseModel>>> activeCourses(
      int yearId) async {
    try {
      final response = await http.post(
          Uri.parse("http://msc-mu.com/api_verfication.php"),
          body: {"flag": "selectcourses", "year": "$yearId"});
      if (response.statusCode == 200) {
        var l = json.decode(response.body) as List<dynamic>;
        var courses = l.map((e) => CourseModel.fromJson(e)).toList();
        return right(courses);
      } else {
        return left(const ApiFailures.noConnection());
      }
    } on SocketException {
      return left(const ApiFailures.noConnection());
    } on HttpException {
      return left(const ApiFailures.notFound());
    }
  }

  @override
  Future<Either<ApiFailures, List<CourseModel>>> archiveCourses(
      int yearId) async {
    try {
      final response = await http.post(
          Uri.parse("http://msc-mu.com/api_verfication.php"),
          body: {"flag": "selectarchive", "year": "$yearId"});
      if (response.statusCode == 200) {
        var l = json.decode(response.body) as List<dynamic>;
        var courses = l.map((e) => CourseModel.fromJson(e)).toList();
        return right(courses);
      } else {
        return left(const ApiFailures.noConnection());
      }
    } on SocketException {
      return left(const ApiFailures.noConnection());
    } on HttpException {
      return left(const ApiFailures.notFound());
    }
  }
}
