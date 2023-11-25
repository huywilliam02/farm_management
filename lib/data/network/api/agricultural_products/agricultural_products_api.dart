import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:itfsd/data/model/agricultural_products/agricultural_products_details.dart';

class AgriculturalProductApi {

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

  static Future<List<AgriculturalProductDetails>> getAllAgricultalProduct(
      int indexPage) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/agricultural-products?order=ASC&page=$indexPage&take=10');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('getAlllistAgriculturalProduct: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      List<AgriculturalProductDetails> listAgriculturalProduct = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listAgriculturalProduct = mapData.map<AgriculturalProductDetails>((json) {
        return AgriculturalProductDetails.fromJson(json);
      }).toList();

      return listAgriculturalProduct;
    } else {
      return Future<List<AgriculturalProductDetails>>.value([]);
    }
  }

  static Future<List<AgriculturalProductDetails>> searchlistAgriculturalProduct(
      String searchData) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/agricultural-products?order=ASC&page=1&take=10&search=$searchData');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('searchAllDataAgriculturalProduct: ${response.statusCode} ${response.body}');
    if (response.statusCode.toString() == '200') {
      List<AgriculturalProductDetails> listAgriculturalProductDetails = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listAgriculturalProductDetails =
          mapData.map<AgriculturalProductDetails>((json) {
        return AgriculturalProductDetails.fromJson(json);
      }).toList();
      return listAgriculturalProductDetails;
    } else {
      return Future<List<AgriculturalProductDetails>>.value([]);
    }
  }
  //
  // static Future<bool> createAgriculturalProduct(
  //     AgriculturalProductModel model, List<String> listPath) async {
  //   var dioRequest = dio.Dio();
  //   dioRequest.options.headers = {
  //     'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
  //     'Content-Type': 'multipart/form-data',
  //     'Accept': 'application/json'
  //   };
  //   // log(model.price.toString());
  //   var formData = dio.FormData.fromMap({
  //     "name": model.name,
  //     "money": model.money,
  //     "quantity": model.quantity,
  //     "weight": model.weight,
  //     "information": model.information,
  //     "time": model.time,
  //     "status": model.status  ? 1 : 0
  //   });
  //
  //   await Future.forEach(listPath, (String path) async {
  //     final multiPartFile = await dio.MultipartFile.fromFile(
  //       path,
  //       contentType: MediaType("image", "jpeg"),
  //     );
  //     formData.files.add(MapEntry('images', multiPartFile));
  //   });
  //   var response = await dioRequest.post(
  //     HttpNetWorkUrlApi.createIngredients,
  //     // 'http://116.118.49.43:8878/api/agricultural-products',
  //     data: formData,
  //   );
  //   log('createAgriculturalProduct- status code : ${response.statusCode}');
  //   log('createAgriculturalProduct - body code : ');
  //   if (response.statusCode == 201) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  //
  // static Future<bool> updataAgriculturalProduct(
  //     AgriculturalProductModel model, List<String> listPath, String idAgriculturalProduct) async {
  //   var dioRequest = dio.Dio();
  //   dioRequest.options.headers = {
  //     'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
  //     'Content-Type': 'multipart/form-data',
  //     'Accept': 'application/json'
  //   };
  //
  //   var formData = dio.FormData.fromMap({
  //     "name": model.name,
  //     "money": model.money,
  //     "quantity": model.quantity,
  //     "weight": model.weight,
  //     "information": model.information,
  //     "time": model.time,

  //     "status": model.status  ? 1 : 0
  //   });
  //
  //   await Future.forEach(listPath as List<String>, (String path) async {
  //     final multiPartFile = await dio.MultipartFile.fromFile(
  //       path,
  //       contentType: MediaType("image", "jpeg"),
  //     );
  //     formData.files.add(MapEntry('images', multiPartFile));
  //   });
  //   var response = await dioRequest.patch(
  //     'http://116.118.49.43:8878/api/agricultural-products/$idAgriculturalProduct',
  //     data: formData,
  //   );
  //   log('updataAgriculturalProduct - status code : ${response.statusCode}');
  //   log('updataAgriculturalProduct  - body code : ');
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  static Future<bool> deleteAgriculturalProduct(String idAgriculturalProduct) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/agricultural-products/$idAgriculturalProduct');
    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('deleteAgriculturalProduct: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      return true;
    } else {
      return false;
    }
  }

}
