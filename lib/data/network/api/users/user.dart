import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:itfsd/data/model/users/user.dart';
import 'package:itfsd/data/model/users/user_details.dart';
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:http_parser/http_parser.dart';

class UserApi {
  static Future<List<UserDetailsModel>> getAllDataUsers(int indexPage) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/users?order=ASC&page=$indexPage&take=10');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('getAllDataUser: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      List<UserDetailsModel> listSupplier = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listSupplier = mapData.map<UserDetailsModel>((json) {
        return UserDetailsModel.fromJson(json);
      }).toList();
      return listSupplier;
    } else {
      return Future<List<UserDetailsModel>>.value([]);
    }
  }

  static Future<bool> createNewUser(UserModel model, String? avatarPath) async {
    var dioRequest = dio.Dio();

    dioRequest.options.headers = {
      'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    var formData = dio.FormData.fromMap({
      "username": model.username,
      "password": model.password,
      "fullName": model.fullName,
      "email": model.email,
      "phoneNumber": model.phoneNumber,
      "role": model.role,
      "jobTitle": model.jobTitle,
      "isLocked": model.isLocked,
      "homeTown": model.homeTown,
      "address": model.address,
      "description": model.description,
    });

    if (avatarPath != null && avatarPath.isNotEmpty) {
      final multiPartFile = await dio.MultipartFile.fromFile(
        avatarPath,
        contentType: MediaType("image", "jpeg"),
      );
      formData.files.add(MapEntry('avatar', multiPartFile));
    }

    try {
      var response = await dioRequest.post(
        'http://116.118.49.43:8878/api/users',
        data: formData,
      );

      log('Dio Response - Status code: ${response.statusCode}');
      log('Dio Response - Data: ${response.data}');

      if (response.statusCode == 201) {
        return true;
      } else {
        log('Error creating user - Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      log('Dio Error: $e');
      return false;
    }
  }

  // static Future<bool> createNewUser(UserModel model, String avatarPath) async {
  //   var dioRequest = dio.Dio();
  //
  //   dioRequest.options.headers = {
  //     'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
  //     'Content-Type': 'application/json', // Update content type if necessary
  //     'Accept': 'application/json',
  //   };
  //
  //   var body = {
  //     "username": model.username,
  //     "password": model.password,
  //     "fullName": model.fullName,
  //     "email": model.email,
  //     "phoneNumber": model.phoneNumber,
  //     "role": model.role,
  //     "jobTitle": model.jobTitle,
  //     "isLocked": model.isLocked,
  //     "homeTown": model.homeTown,
  //     "address": model.address,
  //     "description": model.description,
  //   };
  //
  //   if (avatarPath != null) {
  //     final multiPartFile = await dio.MultipartFile.fromFile(
  //       avatarPath,
  //       contentType: MediaType("image", "jpeg"),
  //     );
  //     body['avatar'] = multiPartFile;
  //   }
  //
  //   try {
  //     var response = await dioRequest.post(
  //       'http://116.118.49.43:8878/api/users',
  //       data: body,
  //     );
  //
  //     log('Dio Response - Status code: ${response.statusCode}');
  //     log('Dio Response - Data: ${response.data}');
  //
  //     if (response.statusCode == 201) {
  //       return true;
  //     } else {
  //       log('Error creating user - Status code: ${response.statusCode}, Error: ${response.data}');
  //       return false;
  //     }
  //   } catch (e) {
  //     log('Dio Error: $e');
  //     return false;
  //   }
  // }

  static Future<bool> updateNewUsers(
      String userId, UserModel model, String avatarPath) async {
    var dioRequest = dio.Dio();

    dioRequest.options.headers = {
      'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json'
    };

    var formData = dio.FormData.fromMap({
      "username": model.username,
      "password": model.password,
      "fullName": model.fullName,
      "email": model.email,
      "phoneNumber": model.phoneNumber,
      "role": model.role,
      "jobTitle": model.jobTitle,
      "isLocked": model.isLocked,
      "homeTown": model.homeTown,
      "address": model.address,
      "description": model.description,
    });

    if (avatarPath != null) {
      final multiPartFile = await dio.MultipartFile.fromFile(
        avatarPath,
        contentType: MediaType("image", "jpeg"),
      );
      formData.files.add(MapEntry('avatar', multiPartFile));
    }
    var response = await dioRequest.post(
      'http://116.118.49.43:8878/api/users',
      data: formData,
    );
    log('createUsers- status code : ${response.statusCode}');
    log('createUsers - body code : ');
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteUsers(String idUsers) async {
    var url =
        Uri.parse('http://116.118.49.43:8878/api/user/delete?id=$idUsers');
    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('deleteUsers: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<UserDetailsModel>> searchListUserDetails(
      String searchData) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/users?order=ASC&page=1&take=10&search=$searchData');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('searchAllDataUserDetailsModel: ${response.statusCode} ${response.body}');
    if (response.statusCode.toString() == '200') {
      List<UserDetailsModel> listCropsFarmDetail = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listCropsFarmDetail = mapData.map<UserDetailsModel>((json) {
        return UserDetailsModel.fromJson(json);
      }).toList();
      return listCropsFarmDetail;
    } else {
      return Future<List<UserDetailsModel>>.value([]);
    }
  }
}
