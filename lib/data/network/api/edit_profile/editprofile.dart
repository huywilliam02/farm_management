import 'dart:convert';

import 'package:itfsd/app/util/dev_utils.dart';
import 'package:itfsd/data/model/editprofile/edit_profile.dart';
import 'package:itfsd/data/model/login/login_model.dart';
import 'package:itfsd/data/model/users/user.dart';
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:http/http.dart' as http;
import '../../../../presentation/controllers/agricultural_products/agricultural_products_constant.dart';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';

class EditProfilelApi {
  static Future<LoginModel?> getDataUser(String accessToken) async {
    var response = await http
        .get(Uri.parse('http://116.118.49.43:8878/api/users/my'), headers: {
      "content-type": "application/json; charset=utf-8",
      'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}'
    });
    if (response.statusCode == 200) {
      Map<String, dynamic>? data = jsonDecode(response.body);
      if (data != null) {
        DevUtils.printLog("LoginData", "po", jsonEncode(data));
        return Future<LoginModel>.value(LoginModel.fromJson(data));
      }
    }
    return null;
  }

  static Future<bool> updateUser(EditProfile model, String avatarPath) async {
    var dioRequest = dio.Dio();

    dioRequest.options.headers = {
      'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json'
    };

    var formData = dio.FormData.fromMap({
      'fullName': model.fullName,
      'jobTitle': model.jobTitle,
      'phoneNumber': model.phoneNumber,
      'description': model.description,
      'address': model.address,
      'homeTown': model.homeTown,
    });

    if (avatarPath != null) {
      final multiPartFile = await dio.MultipartFile.fromFile(
        avatarPath,
        contentType: MediaType("image", "jpeg"),
      );
      formData.files.add(MapEntry('avatar', multiPartFile));
    }

    var response = await dioRequest.put(
      'http://116.118.49.43:8878/api/users',
      data: formData,
    );

    log('UpdateUsers- status code : ${response.statusCode}');

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
