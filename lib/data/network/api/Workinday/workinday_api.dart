import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:itfsd/data/model/crops/crops_detail.dart';
import 'package:itfsd/data/model/land/land.dart';
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:itfsd/data/model/workinday/workindayDetail.dart';
import 'package:itfsd/data/model/workinday/workinday_model.dart';

class WorkInDayApi {
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

  static Future<List<WorkindayDetail>> getAllWorkinday(int indexpage) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/work-of-day/gets?order=ASC&page=$indexpage&take=10');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('getAllWorkinday: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      List<WorkindayDetail> listWorkinday = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listWorkinday = mapData.map<WorkindayDetail>((json) {
        return WorkindayDetail.fromJson(json);
      }).toList();
      return listWorkinday;
    } else {
      return Future<List<WorkindayDetail>>.value([]);
    }
  }

  static Future<List<WorkindayDetail>> searchlistWorkindayDetail(
      String searchData) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/work-of-day/gets?order=ASC&page=1&take=10&search=$searchData');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('searchAlllistWorkindayDetail: ${response.statusCode} ${response.body}');
    if (response.statusCode.toString() == '200') {
      List<WorkindayDetail> listWorkindayDetail = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listWorkindayDetail = mapData.map<WorkindayDetail>((json) {
        return WorkindayDetail.fromJson(json);
      }).toList();
      return listWorkindayDetail;
    } else {
      return Future<List<WorkindayDetail>>.value([]);
    }
  }

  static Future<List<CropsDetail>> getAllCropsFarm() async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/crops?order=ASC&page=1&take=10');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('getAllCropsFarm: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      List<CropsDetail> listCropsFarm = [];

      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listCropsFarm = mapData.map<CropsDetail>((json) {
        return CropsDetail.fromJson(json);
      }).toList();
      return listCropsFarm;
    } else {
      return Future<List<CropsDetail>>.value([]);
    }
  }

  static Future<bool> createWorkInday(
      String idLand, String idCrops, WorkindayModel workindayModel) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/work-of-day/create?landId=$idLand&cropId=$idCrops');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization':
              'bearer ${Get.find<StartAppController>().accessToken}'
        },
        body: jsonEncode(workindayModel.toJson()));
    log('createworkinday: ${response.statusCode} ${response.body}');

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateWorkInday(
      String idWorkInDay, WorkindayModel formCreate) async {
    log(jsonEncode(formCreate.toJson()));
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/work-of-day/update?id=$idWorkInDay');
    final response = await http.patch(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization':
              'bearer ${Get.find<StartAppController>().accessToken}'
        },
        body: jsonEncode(formCreate.toJson()));
    log('updateWorkInDay: ${response.statusCode} ${response.body}');

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteWorkInday(
    String idWorkInDay,
  ) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/work-of-day/delete?id=$idWorkInDay');
    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
