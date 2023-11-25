import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:itfsd/data/model/igredients/ingredientsDetail.dart';
import 'package:itfsd/data/model/igredients/ingredientsModel.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';

class IngredientApi {
  static Future<List<IngredientsDetail>> getAllIngredients(
      int indexPage) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/ingredients?order=ASC&page=$indexPage&take=10');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('getAllIngredientsDetail: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      List<IngredientsDetail> listIngredientsDetail = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listIngredientsDetail = mapData.map<IngredientsDetail>((json) {
        return IngredientsDetail.fromJson(json);
      }).toList();

      return listIngredientsDetail;
    } else {
      return Future<List<IngredientsDetail>>.value([]);
    }
  }

  static Future<List<IngredientsDetail>> searchlistIngredientsDetail(
      String searchData) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/ingredients?order=ASC&page=1&take=10&search=$searchData');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('searchAllIngredientsDetail: ${response.statusCode} ${response.body}');
    if (response.statusCode.toString() == '200') {
      List<IngredientsDetail> listIngredientsDetail = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listIngredientsDetail = mapData.map<IngredientsDetail>((json) {
        return IngredientsDetail.fromJson(json);
      }).toList();
      return listIngredientsDetail;
    } else {
      return Future<List<IngredientsDetail>>.value([]);
    }
  }

  static Future<bool> createIngredients(
      IngredientsModel model, List<String> listPath) async {
    var dioRequest = dio.Dio();
    dioRequest.options.headers = {
      'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json'
    };
    // log(model.price.toString());
    var formData = dio.FormData.fromMap({
      "name": model.name,
      "money": model.money,
      "quantity": model.quantity,
      "weight": model.weight,
      "information": model.information,
      "time": model.time,
      "status": model.status  ? 1 : 0
    });

    await Future.forEach(listPath, (String path) async {
      final multiPartFile = await dio.MultipartFile.fromFile(
        path,
        contentType: MediaType("image", "jpeg"),
      );
      formData.files.add(MapEntry('images', multiPartFile));
    });
    var response = await dioRequest.post(
      HttpNetWorkUrlApi.createIngredients,
      // 'http://116.118.49.43:8878/api/ingredients',
      data: formData,
    );
    log('createIngredients- status code : ${response.statusCode}');
    log('createIngredients - body code : ');
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updataIngredietns(
      IngredientsModel model, List<String> listPath, String idIngredients) async {
    var dioRequest = dio.Dio();
    dioRequest.options.headers = {
      'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json'
    };

    var formData = dio.FormData.fromMap({
      "name": model.name,
      "money": model.money,
      "quantity": model.quantity,
      "weight": model.weight,
      "information": model.information,
      "time": model.time,
      "status": model.status  ? 1 : 0
    });

    await Future.forEach(listPath, (String path) async {
      final multiPartFile = await dio.MultipartFile.fromFile(
        path,
        contentType: MediaType("image", "jpeg"),
      );
      formData.files.add(MapEntry('images', multiPartFile));
    });
    var response = await dioRequest.patch(
      'http://116.118.49.43:8878/api/ingredients/$idIngredients',
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


  static Future<bool> deleteIngredients(String idIngredients) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/ingredients?id=$idIngredients');
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
