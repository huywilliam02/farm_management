import 'dart:convert';
import 'dart:developer';
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:http/http.dart' as http;
import 'package:itfsd/app/util/dev_utils.dart';
import 'package:get/get.dart';
import 'package:itfsd/data/model/login/login_model.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';


class LoginApi {
  static Future<LoginModel?> getDataCustomer(String accessToken) async {
    var response = await http
        .get(Uri.parse('http://116.118.49.43:8878/api/user/gets'), headers: {
      "content-type": "application/json; charset=utf-8",
      'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}'
    });
    if (response.statusCode == 200) {
      //
      Map data = jsonDecode(response.body);
      DevUtils.printLog("LoginData", "po", jsonEncode(data["data"]));
      return Future<LoginModel>.value(LoginModel.fromJson(data["data"]));
    }
    return null;
    // }
  }

  static Future<String> login(
    String username,
    String password,
  ) async {
    Map<String, String> body = {
      "username": username,
      "password": password,
    };
    var response = await http.post(Uri.parse(HttpNetWorkUrlApi.login),
        headers: {
          "Accept": "application/json; charset=utf-8",
          "content-type": "application/json; charset=utf-8",
        },
        body: jsonEncode(body));
    log('login - status: ${response.statusCode}');
    log('login - body: ${response.body}');
    if (response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception();
    }
  }

  static Future<dynamic> refeshToken(String refeshToken) async {
    var response = await http.post(Uri.parse(HttpNetWorkUrlApi.refeshToken),
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${Get.find<StartAppController>().accessToken}'
        },
        body: jsonEncode(<String, dynamic>{"refreshToken": refeshToken}));
    log('refeshToken - status: ${response.statusCode}');
    log('refeshToken - body: ${response.body}');
    return response;
  }

  //   var headers = {
  //     'accept': '*/*',
  //     'Authorization': 'Bearer $refreshToken',
  //     'Content-Type': 'application/json'
  //   };
  //   var request = http.Request(
  //       'POST', Uri.parse('http://116.118.49.43:8878/api/auth/refresh-tokens'));
  //   request.body = json.encode({});
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }
}
