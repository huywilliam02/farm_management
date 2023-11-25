import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:itfsd/data/model/customer/customer_detail.dart';
import 'package:itfsd/data/model/customer/customer_model.dart';

class CustomerApi {
  static Future<List<CustomerDetail>> getAllCustomer(int indexPage) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/visitor/gets?order=ASC&page=$indexPage&take=10');
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
      List<CustomerDetail> listCustomer = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listCustomer = mapData.map<CustomerDetail>((json) {
        return CustomerDetail.fromJson(json);
      }).toList();

      return listCustomer;
    } else {
      return Future<List<CustomerDetail>>.value([]);
    }
  }

  static Future<bool> createcustomer(CustomerModel customerModel) async {
    var url = Uri.parse('http://116.118.49.43:8878/api/visitor/create');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization':
              'bearer ${Get.find<StartAppController>().accessToken}'
        },
        body: jsonEncode(customerModel.toJson()));
    log('createcustomer: ${response.statusCode} ${response.body}');

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateCustomer(
      String idCustomer, CustomerModel formCreate) async {
    log(jsonEncode(formCreate.toJson()));
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/visitor/update?id=$idCustomer');
    final response = await http.patch(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization':
              'bearer ${Get.find<StartAppController>().accessToken}'
        },
        body: jsonEncode(formCreate.toJson()));
    log('updateCustomer: ${response.statusCode} ${response.body}');

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteCustomerApi(String idCustomer) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/visitor/delete?id=$idCustomer');
    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('deleteidCustomer: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      return true;
    } else {
      return false;
    }
  }
}
