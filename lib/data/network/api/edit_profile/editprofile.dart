import 'dart:convert';

import 'package:itfsd/app/util/dev_utils.dart';
import 'package:itfsd/data/model/login/login_model.dart';
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:http/http.dart' as http;
import '../../../../presentation/controllers/agricultural_products/agricultural_products_constant.dart';

class EditProfilelApi {
  // static Future<LoginModel?> getDataUser(String accessToken) async {
  //   var response = await http
  //       .get(Uri.parse('http://116.118.49.43:8878/api/user/my'), headers: {
  //     "content-type": "application/json; charset=utf-8",
  //     'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}'
  //   });
  //   if (response.statusCode == 200) {
  //     //
  //     Map data = jsonDecode(response.body);
  //     DevUtils.printLog("LoginData", "po", jsonEncode(data));
  //     return Future<LoginModel>.value(LoginModel.fromJson(data["data"]));
  //   }
  //   return null;
  //   // }
  // }

  static Future<LoginModel?> getDataUser(String accessToken) async {
    var response = await http
        .get(Uri.parse('http://116.118.49.43:8878/api/user/my'), headers: {
      "content-type": "application/json; charset=utf-8",
      'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}'
    });
    if (response.statusCode == 200) {
      Map<String, dynamic>? data = jsonDecode(response.body);
      if (data != null) {
        DevUtils.printLog("LoginData", "po", jsonEncode(data));
        return Future<LoginModel>.value(LoginModel.fromJson(data));
      }
    }
    return null;
  }
}
