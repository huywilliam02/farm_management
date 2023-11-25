import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:itfsd/data/model/requestform/requestfarm.dart';
import 'package:itfsd/data/model/requestform/requestformDetail.dart';

class RequestFormApi {
  static Future<List<RequestFormDetail>> getAllDataRequestForm(int indexpage) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/bill-request/gets?order=ASC&page=$indexpage&take=10');
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
      List<RequestFormDetail> listSupplier = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listSupplier = mapData.map<RequestFormDetail>((json) {
        return RequestFormDetail.fromJson(json);
      }).toList();
      return listSupplier;
    } else {
      return Future<List<RequestFormDetail>>.value([]);
    }
  }

  static Future<bool> createRequestForm(RequestForm requestForm) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/bill-request/create-bill-request');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization':
              'bearer ${Get.find<StartAppController>().accessToken}'
        },
        body: jsonEncode(requestForm.toJson()));
    log('createRequestForm : ${response.statusCode} ${response.body}');

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateRequestForm(
      String idRequestForm, RequestForm formCreate) async {
    log(jsonEncode(formCreate.toJson()));
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/bill-request/update?id=$idRequestForm');
    final response = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization':
              'bearer ${Get.find<StartAppController>().accessToken}'
        },
        body: jsonEncode(formCreate.toJson()));
    log('updateClient: ${response.statusCode} ${response.body}');

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteRequestform(String idrequestform) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/bill-request/delete?id=$idrequestform');
    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('deleteTree: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<RequestFormDetail>> searchlistRequestFormDetail(
      String searchData) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/bill-request/gets?order=ASC&page=1&take=10&search=$searchData');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('searchAllDatacropsFarm: ${response.statusCode} ${response.body}');
    if (response.statusCode.toString() == '200') {
      List<RequestFormDetail> listCropsFarmDetail = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listCropsFarmDetail = mapData.map<RequestFormDetail>((json) {
        return RequestFormDetail.fromJson(json);
      }).toList();
      return listCropsFarmDetail;
    } else {
      return Future<List<RequestFormDetail>>.value([]);
    }
  }
}
