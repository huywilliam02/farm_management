import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:http/http.dart' as http;
import 'package:itfsd/data/model/client_farm/client_detail.dart';
import 'package:itfsd/data/model/client_farm/client_model.dart';

class ClientApi {
  static Future<List<ClientDetail>> getAllDataClient(int indexPage) async {
    var url = Uri.parse(
        // 'http://116.118.49.43:8878/api/persons/getsByType?type=KHACH_HANG&order=$indexPage&take=10');
        'http://116.118.49.43:8878/api/persons/getsByType?type=KHACH_HANG&order=ASC&page=$indexPage&take=10');
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
      List<ClientDetail> listClient = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listClient = mapData.map<ClientDetail>((json) {
        return ClientDetail.fromJson(json);
      }).toList();
      return listClient;
    } else {
      return Future<List<ClientDetail>>.value([]);
    }
  }

  static Future<bool> createClient(ClientModel client) async {
    var url =
        Uri.parse('http://116.118.49.43:8878/api/persons?type=KHACH_HANG');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization':
              'bearer ${Get.find<StartAppController>().accessToken}'
        },
        body: jsonEncode(client.toJson()));
    log('createclient: ${response.statusCode} ${response.body}');

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateClient(
      String idClientDetail, ClientModel formCreate) async {
    log(jsonEncode(formCreate.toJson()));
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/persons/update?id=$idClientDetail');
    final response = await http.patch(url,
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

  static Future<List<ClientDetail>> searchClient(String searchData) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/persons/getsByType?type=KHACH_HANG&order=ASC&page=1&take=10&search=$searchData');
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
      List<ClientDetail> listClient = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listClient = mapData.map<ClientDetail>((json) {
        return ClientDetail.fromJson(json);
      }).toList();
      return listClient;
    } else {
      return Future<List<ClientDetail>>.value([]);
    }
  }

  static Future<bool> deletecontactApi(String idClient) async {
    var url =
        Uri.parse('http://116.118.49.43:8878/api/persons/delete?id=$idClient');
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
}
