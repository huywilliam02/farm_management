import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:itfsd/data/model/otherobject/otherObject_detail.dart';
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:itfsd/data/model/otherobject/otherObjectModel.dart';
class OtherObjectApi {
  static Future<List<OtherObjectDetail>> getAllDataOtherObject(
      int indexPage) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/persons/getsByType?type=DOI_TUONG_KHAC&order=ASC&page=$indexPage&take=10');
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
      List<OtherObjectDetail> listOtherObject = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listOtherObject = mapData.map<OtherObjectDetail>((json) {
        return OtherObjectDetail.fromJson(json);
      }).toList();
      return listOtherObject;
    } else {
      return Future<List<OtherObjectDetail>>.value([]);
    }
  }

  static Future<bool> createOtherObject(OtherObjectModel otherObject) async {
    var url =
        Uri.parse('http://116.118.49.43:8878/api/persons?type=DOI_TUONG_KHAC');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization':
              'bearer ${Get.find<StartAppController>().accessToken}'
        },
        body: jsonEncode(otherObject.toJson()));
    log('createotherObject: ${response.statusCode} ${response.body}');

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateOtherObject(
      String idOtherObjectDetail, OtherObjectModel formCreate) async {
    log(jsonEncode(formCreate.toJson()));
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/persons/update?id=$idOtherObjectDetail');
    final response = await http.patch(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization':
              'bearer ${Get.find<StartAppController>().accessToken}'
        },
        body: jsonEncode(formCreate.toJson()));
    log('updateOtherObject: ${response.statusCode} ${response.body}');

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}