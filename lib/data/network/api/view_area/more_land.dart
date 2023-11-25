import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:itfsd/data/model/farm/farm.dart';
import 'package:itfsd/data/model/area/moreLand.dart';


class MoreLandApi {
  static Future<List<Farm>> getAllFarm() async {
    var response = await http.get(
      Uri.parse('http://116.118.49.43:8878/api/farm/all'),
      headers: {
        "Accept": "application/json; charset=utf-8",
        "content-type": "application/json; charset=utf-8",
        'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('getAllFarm - status code : ${response.statusCode}');
    log('getAllFarm - body code : ${response.body}');
    if (response.statusCode == 200) {
      List<Farm> listFarm = [];
      final mapData = jsonDecode(response.body).cast<Map<String, dynamic>>();
      listFarm = mapData.map<Farm>((json) {
        return Farm.fromJson(json);
      }).toList();
      return listFarm;
    } else {
      return [];
    }
  }

  static Future<List<MorelandModel>> getAllArea() async {
    var response = await http.get(
      Uri.parse('http://116.118.49.43:8878/api/area/all'),
      headers: {
        "Accept": "application/json; charset=utf-8",
        "content-type": "application/json; charset=utf-8",
        'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('getAllArea - status code : ${response.statusCode}');
    log('getAllArea - body code : ${response.body}');
    if (response.statusCode == 200) {
      List<MorelandModel> listArea = [];
      final mapData = jsonDecode(response.body).cast<Map<String, dynamic>>();
      listArea = mapData.map<MorelandModel>((json) {
        return MorelandModel.fromJson(json);
      }).toList();
      return listArea;
    } else {
      return [];
    }
  }
  static Future<bool> createNewLand(
      MorelandModel model, List<String> listPath) async {
    var dioRequest = dio.Dio();
    dioRequest.options.headers = {
      'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json'
    };
    List dataTest = [];
    for (var element in model.locations) {
      dataTest.add(json.encode(element));
    }
    var formData = dio.FormData.fromMap({
      "name": model.name,
      "description": model.description,
      "acreage": model.acreage,
      "locations": dataTest
    });

    await Future.forEach(listPath, (String path) async {
      final multiPartFile = await dio.MultipartFile.fromFile(
        path,
        contentType: MediaType("image", "jpeg"),
      );
      formData.files.add(MapEntry('avatars', multiPartFile));
    });
    var response = await dioRequest.post(
      'http://116.118.49.43:8878/api/area?farmId=${model.farmId}',
      data: formData,
    );
    log('createNewLand - status code : ${response.statusCode}');
    log('createNewLand - body code : ');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
