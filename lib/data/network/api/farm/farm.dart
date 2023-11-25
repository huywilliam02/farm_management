import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:itfsd/data/model/category/product.dart';
import 'package:itfsd/data/model/farm/farm.dart';

class FarmApi {
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

}
