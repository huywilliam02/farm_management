import 'package:itfsd/data/model/editprofile/edit_profile.dart';
import 'package:itfsd/presentation/page/login/login.dart';
import 'package:dio/dio.dart' as dio;
export 'dart:convert';
export 'dart:developer';
export 'package:dio/dio.dart';
export 'package:itfsd/data/model/users/user.dart';
export 'package:itfsd/data/model/users/user_details.dart';
export 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
export 'package:http_parser/http_parser.dart';
export 'dart:async';
export 'package:itfsd/data/enums/http_method.dart';
export 'package:itfsd/data/network/api_request_representable.dart';
export "package:itfsd/presentation/page/login/login_page.dart";
export 'package:itfsd/data/network/providers/api_provider.dart';

class UserApi {
  // static Future<List<UserDetailsModel>> getAllDataUsers(int indexPage) async {
  //   var url = Uri.parse(
  //       'http://116.118.49.43:8878/api/users?order=ASC&page=$indexPage&take=10');
  //   final response = await http.get(
  //     url,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Accept': 'application/json; charset=UTF-8',
  //       'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
  //     },
  //   );
  //   log('getAllDataUser: ${response.statusCode} ${response.body}');
  //
  //   if (response.statusCode.toString() == '200') {
  //     List<UserDetailsModel> users = [];
  //     final mapData =
  //         jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
  //     users = mapData.map<UserDetailsModel>((json) {
  //       return UserDetailsModel.fromJson(json);
  //     }).toList();
  //     return users;
  //   } else {
  //     return Future<List<UserDetailsModel>>.value([]);
  //   }
  // }

  // static Future<bool> createNewUser(UserModel model, String? avatarPath) async {
  //   var dioRequest = dio.Dio();
  //
  //   dioRequest.options.headers = {
  //     'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
  //     'content-Type': 'application/json; charset=utf-8',
  //     'accept': '*/*',
  //   };
  //
  //   var formData = dio.FormData.fromMap({
  //     'homeTown': model.homeTown,
  //     'address': model.address,
  //     'role': model.role,
  //     'username': model.username,
  //     'phoneNumber': model.phoneNumber,
  //     'fullName': model.fullName,
  //     'jobTitle': model.jobTitle,
  //     'password': model.password,
  //     'email': model.email,
  //     'description': model.description,
  //   });
  //
  //   if (avatarPath != null && avatarPath.isNotEmpty) {
  //     final multiPartFile = await dio.MultipartFile.fromFile(
  //       avatarPath,
  //       contentType: MediaType("image", "jpeg"),
  //     );
  //     formData.files.add(MapEntry('avatar', multiPartFile));
  //   }
  //   try {
  //     var response = await dioRequest.post(
  //       'http://116.118.49.43:8878/api/users',
  //       data: formData,
  //     );
  //
  //     log('Dio Response - Status code: ${response.statusCode}');
  //     log('Dio Response - Data: ${response.data}');
  //
  //     if (response.statusCode == 201) {
  //       return true;
  //     } else {
  //       log('Error creating user - Status code: ${response.statusCode}');
  //       return false;
  //     }
  //   } catch (e) {
  //     log('Dio Error: $e');
  //     return false;
  //   }
  // }

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

  // static Future<bool> updateNewUser(EditProfile model) async {
  //   var dioRequest = dio.Dio();
  //
  //   dioRequest.options.headers = {
  //     'accept': '*/*',
  //     'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
  //     'Content-Type': 'multipart/form-data',
  //   };
  //   var formData = dio.FormData.fromMap({
  //     "fullName": model.fullName,
  //     "jobTitle": model.jobTitle,
  //     "phoneNumber": model.phoneNumber,
  //     "description": model.description,
  //     "address": model.address,
  //     "homeTown": model.homeTown,
  //   });
  //
  //   var response = await dioRequest.put(
  //     'http://116.118.49.43:8878/api/users',
  //     data: formData,
  //   );
  //
  //
  //   log('UpdateUsers- status code : ${response.statusCode}');
  //
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // static Future<bool> deleteUser(String idUsers) async {
  //   var headers = {
  //     'accept': '*/*',
  //     'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}'
  //   };
  //   var dio = Dio();
  //   var response = await dio.request(
  //     'http://116.118.49.43:8878/api/users?id=$idUsers',
  //     options: Options(
  //       method: 'DELETE',
  //       headers: headers,
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // static Future<List<UserDetailsModel>> searchListUserDetails(
  //     String searchData) async {
  //   var url = Uri.parse(
  //       'http://116.118.49.43:8878/api/users?order=ASC&page=1&take=10&search=$searchData');
  //   final response = await http.get(
  //     url,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Accept': 'application/json; charset=UTF-8',
  //       'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
  //     },
  //   );
  //   log('searchAllDataUserDetailsModel: ${response.statusCode} ${response.body}');
  //   if (response.statusCode.toString() == '200') {
  //     List<UserDetailsModel> listCropsFarmDetail = [];
  //     final mapData =
  //         jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
  //     listCropsFarmDetail = mapData.map<UserDetailsModel>((json) {
  //       return UserDetailsModel.fromJson(json);
  //     }).toList();
  //     return listCropsFarmDetail;
  //   } else {
  //     return Future<List<UserDetailsModel>>.value([]);
  //   }
  // }
}
