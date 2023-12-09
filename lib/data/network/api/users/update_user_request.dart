import 'package:dio/dio.dart' as dio; // Use an alias for Dio
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:itfsd/data/model/editprofile/edit_profile.dart';
import 'package:itfsd/data/network/api/users/user.dart';

class UpdateUserRequest implements APIRequestRepresentable {
  final EditProfile model;
  final String? avatarPath;

  UpdateUserRequest({
    required this.model,
    this.avatarPath,
  });

  @override
  String get url => 'http://116.118.49.43:8878/api/users';

  @override
  String get endpoint => '/api/users'; // Adjust accordingly

  @override
  String get path => ''; // No path needed for PUT

  @override
  HTTPMethod get method => HTTPMethod.put;

  @override
  Map<String, String>? get headers => {
        'accept': '*/*',
        'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
        'Content-Type': 'multipart/form-data;boundary=my_custom_boundary',
      };

  @override
  Map<String, String>? get query => null;

  @override
  dynamic get body {
    var formData = dio.FormData.fromMap({
      "fullName": model.fullName,
      "jobTitle": model.jobTitle,
      "phoneNumber": model.phoneNumber,
      "description": model.description,
      "address": model.address,
      "homeTown": model.homeTown,
    });
    return formData;
  }

  Future<bool> execute() async {
    var dioRequest = dio.Dio();

    dioRequest.options.headers = {
      'accept': '*/*',
      'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
      'Content-Type': 'multipart/form-data',
    };
    var formData = dio.FormData.fromMap({
      "fullName": model.fullName,
      "jobTitle": model.jobTitle,
      "phoneNumber": model.phoneNumber,
      "description": model.description,
      "address": model.address,
      "homeTown": model.homeTown,
    });
    if (avatarPath != null && avatarPath!.isNotEmpty) {
      final multiPartFile = await dio.MultipartFile.fromFile(
        avatarPath!,
        contentType:
            MediaType('image', 'jpeg'), // Use MediaType from http_parser
      );
      formData.files.add(MapEntry('avatar', multiPartFile)); // Use MapEntry
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

  @override
  Future request() {
    // TODO: implement request
    throw execute();
  }
}
