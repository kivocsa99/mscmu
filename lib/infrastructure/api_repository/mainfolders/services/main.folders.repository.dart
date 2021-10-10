import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../domain/i_api_request/failures/api.failures.dart';
import '../../../../domain/i_api_request/mainfolder/contracts/i.mainfolder.repository.dart';
import '../../../../domain/models/mainfoldermodel.dart';

class MainFolderRepository implements IMainFolderRepository {
  @override
  Future<Either<ApiFailures, List<MainFolderModel>?>> getmainfolders(
      int id) async {
    try {
      final response = await http.post(
          Uri.parse("http://msc-mu.com/api_verfication.php"),
          body: {"flag": "selectmainfolders", "course": "$id"});
      if (response.statusCode == 200) {
        var l = json.decode(response.body) as List<dynamic>?;
        var folders = l?.map((e) => MainFolderModel.fromJson(e)).toList();
        return folders != null ? right(folders) : right(null);
      } else {
        return left(const ApiFailures.notFound());
      }
    } on SocketException {
      return left(const ApiFailures.noConnection());
    } on HttpException {
      return left(const ApiFailures.notFound());
    }
  }
}
