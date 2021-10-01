import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../domain/i_api_request/content/contracts/i.content.repository.dart';
import '../../../../domain/i_api_request/failures/api.failures.dart';
import '../../../../domain/models/contentmodel.dart';

class ContentRepository implements IContentRepository {
  @override
  Future<Either<ApiFailures, ContentModel>> getcontent(int id) async {
    try {
      final response = await http.post(
          Uri.parse("http://msc-mu.com/api_verfication.php"),
          body: {"flag": "selectcontent", "folder": "$id"});
      if (response.statusCode == 200) {
        var l = json.decode(response.body) as Map<String, dynamic>;
        var content = ContentModel.fromJson(l);
        return right(content);
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
