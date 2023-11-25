import 'dart:convert';
import 'dart:developer';
import 'package:http_parser/http_parser.dart';
import 'package:itfsd/data/model/land/land.dart';
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:itfsd/data/model/category/product.dart';
import 'package:itfsd/data/model/category/soilTypeModel.dart';

class LanddivisionApi {
  static Future<List<SoilType>> getAllLandType() async {
    var response = await http.get(
      Uri.parse('http://116.118.49.43:8878/api/soil-type/all'),
      headers: {
        "Accept": "application/json; charset=utf-8",
        "content-type": "application/json; charset=utf-8",
        'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('getAllFarm - status code : ${response.statusCode}');
    log('getAllFarm - body code : ${response.body}');
    if (response.statusCode == 200) {
      List<SoilType> listLandType = [];
      final mapData = jsonDecode(response.body).cast<Map<String, dynamic>>();
      listLandType = mapData.map<SoilType>((json) {
        return SoilType.fromJson(json);
      }).toList();
      return listLandType;
    } else {
      return [];
    }
  }

  static Future<bool> createNewLandDevision(
      LandDivision model, List<String> listPath) async {
    var dioRequest = dio.Dio();
    dioRequest.options.headers = {
      'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json'
    };
    List location = [];
    for (var element in model.locations!) {
      location.add(json.encode(element));
    }
    var formData = dio.FormData.fromMap({
      "name": model.name,
      "productTypeId": model.productType!.id,
      "acreage": model.acreage,
      "soilTypeId": model.solidTypeId,
      "locations": location,
    });
    log({
      "name": model.name,
      "productTypeId ": model.productType!.id,
      "acreage": model.acreage,
      "soilTypeId": model.solidTypeId,
      "locations": location,
    }.toString());
    await Future.forEach(listPath, (String path) async {
      final multiPartFile = await dio.MultipartFile.fromFile(
        path,
        contentType: MediaType("image", "jpeg"),
      );

      formData.files.add(MapEntry('images', multiPartFile));
    });
    var response = await dioRequest.post(
      'http://116.118.49.43:8878/api/land/create?areaId=${model.area!.id}',
      data: formData,
    );
    log('createNewLandDevision - status code : ${response.statusCode}');
    log('createNewLandDevision - body code : ${response.data}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Product>> getAllDataByTypeCategory(String type) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/categories/getsByCategory?type=$type');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('getAllDataByTypeCategory: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      List<Product> listProduct = [];
      final mapData = jsonDecode(response.body).cast<Map<String, dynamic>>();
      listProduct = mapData.map<Product>((json) {
        return Product.fromJson(json);
      }).toList();
      return listProduct;
    } else {
      return Future<List<Product>>.value([]);
    }
  }

  static Future<List<LandDivision>> getAllLand() async {
    var response = await http.get(
      Uri.parse('http://116.118.49.43:8878/api/land/all'),
      headers: {
        "Accept": "application/json; charset=utf-8",
        "content-type": "application/json; charset=utf-8",
        'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('getAllLand - status code : ${response.statusCode}');
    log('getAllLand - body code : ${response.body}');
    if (response.statusCode == 200) {
      List<LandDivision> listLandType = [];
      final mapData = jsonDecode(response.body).cast<Map<String, dynamic>>();
      listLandType = mapData.map<LandDivision>((json) {
        return LandDivision.fromJson(json);
      }).toList();
      return listLandType;
    } else {
      return [];
    }
  }
}
