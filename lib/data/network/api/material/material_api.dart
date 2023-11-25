import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:itfsd/data/model/category/product.dart';
import 'package:itfsd/data/model/material/materialdetail.dart';
import 'package:itfsd/data/model/material/materialmodel.dart';

class MaterialApi {
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

  static Future<List<MaterialDetail>> getAllDataMaterial(int indexPage) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/material?order=ASC&page=$indexPage&take=10');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('getAllDataClient: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      List<MaterialDetail> listMaterial = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listMaterial = mapData.map<MaterialDetail>((json) {
        return MaterialDetail.fromJson(json);
      }).toList();
      return listMaterial;
    } else {
      return Future<List<MaterialDetail>>.value([]);
    }
  }

  static Future<List<MaterialDetail>> searchMaterial(String searchData) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/material?order=ASC&page=1&take=5&search=$searchData');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('getAllDataClient: ${response.statusCode} ${response.body}');
    if (response.statusCode.toString() == '200') {
      List<MaterialDetail> listMaterial = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listMaterial = mapData.map<MaterialDetail>((json) {
        return MaterialDetail.fromJson(json);
      }).toList();
      return listMaterial;
    } else {
      return Future<List<MaterialDetail>>.value([]);
    }
  }

  static Future<bool> createMaterial(
      MaterialModel model, List<String> listPath) async {
    var dioRequest = dio.Dio();
    dioRequest.options.headers = {
      'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json'
    };
    log(model.price.toString());
    var formData = dio.FormData.fromMap({
      "name": model.name,
      "quantity": model.quantity,
      "description": model.description,
      "price": model.price,
      "materialGroupId": model.materialGroup,
      "status": model.status ? 1 : 0
    });

    await Future.forEach(listPath, (String path) async {
      final multiPartFile = await dio.MultipartFile.fromFile(
        path,
        contentType: MediaType("image", "jpeg"),
      );
      formData.files.add(MapEntry('images', multiPartFile));
    });
    var response = await dioRequest.post(
      'http://116.118.49.43:8878/api/material',
      data: formData,
    );
    log('creatematerial- status code : ${response.statusCode}');
    log('creatematerial - body code : ');
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updataMaterial(
      MaterialModel model, List<String> listPath, String idMaterial) async {
    var dioRequest = dio.Dio();
    dioRequest.options.headers = {
      'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json'
    };

    var formData = dio.FormData.fromMap({
      "name": model.name,
      "quantity": model.quantity,
      "description": model.description,
      "pirce": model.price,
      "materialGroup": model.materialGroup,
    });

    await Future.forEach(listPath, (String path) async {
      final multiPartFile = await dio.MultipartFile.fromFile(
        path,
        contentType: MediaType("image", "jpeg"),
      );
      formData.files.add(MapEntry('images', multiPartFile));
    });
    var response = await dioRequest.patch(
      'http://116.118.49.43:8878/api/material/update?id=$idMaterial',
      data: formData,
    );
    log('updata - status code : ${response.statusCode}');
    log('updata  - body code : ');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteMaterial(String idMaterial) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/material/delete?id=$idMaterial');
    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('deleteMaterial: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      return true;
    } else {
      return false;
    }
  }
}
