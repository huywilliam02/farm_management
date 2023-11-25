import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:http/http.dart' as http;
import 'package:itfsd/data/model/supplier/supplier_detail.dart';
import 'package:itfsd/data/model/supplier/supplier_model.dart';

class SupplierApi {
  static Future<List<SupplierDetail>> getAllDataSupplier(
      int indexPageSupplier) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/persons/getsByType?type=PROVIDER&order=ASC&page=$indexPageSupplier&take=10');
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
      List<SupplierDetail> listSupplier = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listSupplier = mapData.map<SupplierDetail>((json) {
        return SupplierDetail.fromJson(json);
      }).toList();
      return listSupplier;
    } else {
      return Future<List<SupplierDetail>>.value([]);
    }
  }

  static Future<bool> createSupplier(Supplier supplier) async {
    var url = Uri.parse('http://116.118.49.43:8878/api/persons?type=PROVIDER');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization':
              'bearer ${Get.find<StartAppController>().accessToken}'
        },
        body: jsonEncode(supplier.toJson()));
    log('createSupplier: ${response.statusCode} ${response.body}');

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateSupplier(
      String idSupplierDetail, Supplier formCreate) async {
    log(jsonEncode(formCreate.toJson()));
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/persons/update?id=$idSupplierDetail');
    final response = await http.patch(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization':
              'bearer ${Get.find<StartAppController>().accessToken}'
        },
        body: jsonEncode(formCreate.toJson()));
    log('updateSchedule: ${response.statusCode} ${response.body}');

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<SupplierDetail>> searchMaterial(String searchData) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/persons/getsByType?type=PROVIDER&order=ASC&page=1&take=10&search=$searchData');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('searchAllDataClient: ${response.statusCode} ${response.body}');
    if (response.statusCode.toString() == '200') {
      List<SupplierDetail> listMaterial = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listMaterial = mapData.map<SupplierDetail>((json) {
        return SupplierDetail.fromJson(json);
      }).toList();
      return listMaterial;
    } else {
      return Future<List<SupplierDetail>>.value([]);
    }
  }
}
