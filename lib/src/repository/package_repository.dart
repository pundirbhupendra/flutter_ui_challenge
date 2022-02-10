import 'dart:convert';
import 'dart:io';
import 'package:flutter_ui_challenge/src/features/home/model/package_data_model.dart';
import 'package:http/http.dart' as http;

class PackageRepository {
  Future<PackagesDataModel?> fechPackageData() async {
    try {
      final response =
          await http.get(Uri.parse('https://cgprojects.in/flutter/'));

      if (response.statusCode == 200) {
        final res = json.decode(response.body);
        PackagesDataModel packagesDataModel = PackagesDataModel.fromJson(res);

        return packagesDataModel;
      }
      return null;
    } catch (e) {
      throw 'Data not found';
    }
  }
}
