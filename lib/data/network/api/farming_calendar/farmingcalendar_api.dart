import 'dart:convert';
import 'dart:developer';
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:itfsd/data/model/category/product.dart';
import 'package:itfsd/data/model/category/table_tree.dart';
import 'package:itfsd/data/model/farming_calendar/form_schedule.dart';
import 'package:itfsd/data/model/farming_calendar/schedule-detail.dart';
import 'package:itfsd/data/model/users/user.dart';

class FarmingcalendarApi {
  static Future<List<TabletreeModel>> getAllcategoriesApi() async {
    var headers = {
      'accept': '*/*',
      'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}'
    };
    var request = http.Request(
        'GET', Uri.parse('http://116.118.49.43:8878/api/categories/gets'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    log('getAllcategories- status code : ${response.statusCode}');
    log('getAllcategories- body code : ${request.body}');
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      if (request.body.isNotEmpty) {
        if (response.statusCode == 200) {
          List<TabletreeModel> listArea = [];
          final mapData = jsonDecode(request.body).cast<Map<String, dynamic>>();
          listArea = mapData.map<TabletreeModel>((json) {
            return TabletreeModel.fromJson(json);
          }).toList();
          return listArea;
        }
      }
    }
    return [];
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

  static Future<List<UserModel>> getAllUser() async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/user/gets?order=ASC&page=1&take=50');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('getAllUser: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      List<UserModel> listProduct = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listProduct = mapData.map<UserModel>((json) {
        return UserModel.fromJson(json);
      }).toList();
      return listProduct;
    } else {
      return Future<List<UserModel>>.value([]);
    }
  }

  static Future<List<DetailSchedule>> getAllSchedule(int indexPage) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/farming-calender/gets?order=ASC&page=$indexPage&take=50');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('getAllSchedule: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      List<DetailSchedule> listProduct = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listProduct = mapData.map<DetailSchedule>((json) {
        return DetailSchedule.fromJson(json);
      }).toList();
      return listProduct;
    } else {
      return Future<List<DetailSchedule>>.value([]);
    }
  }

  static Future<bool> createSchedule(
      String idLanDevision, FormCreateSchedule formCreate) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/farming-calender/create?landId=$idLanDevision');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization':
              'bearer ${Get.find<StartAppController>().accessToken}'
        },
        body: jsonEncode(formCreate.toJson()));
    log('createSchedule: ${response.statusCode} ${response.body}');

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateSchedule(
      String idScheduleDetail, FormCreateSchedule formCreate) async {
    log(jsonEncode(formCreate.toJson()));
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/farming-calender/update?id=$idScheduleDetail');
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

  //http://116.118.49.43:8878/api/farming-calender/delete?id=817ba2bf-19c2-4aa6-982a-d046f4801f13

  static Future<bool> deletefarmingcalender(String idfarmingcalender) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/farming-calender/delete?id=$idfarmingcalender');
    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('deletefarming-calender: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<DetailSchedule>> searchlistDetailSchedule(
      String searchData) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/farming-calender/gets?order=ASC&page=1&take=10&search=$searchData');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('searchAlllistDetailSchedule: ${response.statusCode} ${response.body}');
    if (response.statusCode.toString() == '200') {
      List<DetailSchedule> listDetailSchedule = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listDetailSchedule = mapData.map<DetailSchedule>((json) {
        return DetailSchedule.fromJson(json);
      }).toList();
      return listDetailSchedule;
    } else {
      return Future<List<DetailSchedule>>.value([]);
    }
  }
}
