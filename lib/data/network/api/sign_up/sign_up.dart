import 'package:itfsd/presentation/page/login/login.dart';
import 'package:http/http.dart' as http;

class SignUpApi {
  static Future<bool> createContact(SignUpModel model) async {
    var url = Uri.parse('http://116.118.49.43:8878/api/contact/create');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()));
    log('createContact: ${response.statusCode} ${response.body}');

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
