import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:itfsd/data/model/login/login_model.dart';

import '../../../model/sign_up/sign_up.dart';

class SignUpApi {
  static Future<LoginModel?> register(SignUpModel model) async {
    LoginModel loginModel = LoginModel();
    var response = await http.post(
        Uri.parse('http://116.118.49.43:8878/api/auth/register'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        body: jsonEncode(model.toJson()));
    print(response.statusCode);
    print(response.body);
    print(response);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      // await DatabaseLocal.instance.setJwtToken(data["accesstoken"]);
      loginModel = LoginModel.fromJson(data['user']);

      return Future<LoginModel>.value(loginModel);
    } else {
      // return null;

      throw Exception(jsonDecode(response.body)['code'].toString());
    }
    //   Map data =jsonDecode(response.body);
    //  LoginModel rs= LoginModel.fromJson(data["data"]);
    //  print(rs.accessToken);
    // Map data = jsonDecode(response.body);
    // return Future<LoginModel>.value(LoginModel.fromJson(data["data"]));
    // }
  }
}
