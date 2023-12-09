import '../../../../presentation/page/login/login.dart';
import 'user.dart';

class UpdateUserAdminRequest implements APIRequestRepresentable {
  final String? idUser;
  final UserModel formEdit;

  UpdateUserAdminRequest({required this.idUser, required this.formEdit});

  @override
  String get url => 'http://116.118.49.43:8878/api/users/admin?userId=$idUser';

  @override
  String get endpoint => '/api/users/admin'; // Adjust accordingly

  @override
  String get path => ''; // No path needed for PUT

  @override
  HTTPMethod get method => HTTPMethod.put;

  @override
  Map<String, String>? get headers => {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer ${_getAccessToken()}', // Update with your access token
      };

  @override
  Map<String, String>? get query => null;

  @override
  dynamic get body => formEdit.toJson();

  Future<bool> execute() async {
    try {
      var dio = Dio(); // Create a Dio instance
      var response = await dio.put(
        'http://116.118.49.43:8878/api/users/admin?userId=$idUser',
        data: formEdit.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${_getAccessToken()}',
          },
        ),
      );
      // var response = await APIProvider.instance.request(this);
      if (response.statusCode == 200) {
        return true;
      } else {
        // Handle other response scenarios if needed
        print('Error updating user. Response: ${response.data}');
        return false;
      }
    } catch (e) {
      // Handle exceptions
      print('Error updating user: $e');
      return false;
    }
  }

  String _getAccessToken() {
    // Safely retrieve the access token from the controller
    final startAppController = Get.find<StartAppController>();
    return startAppController.accessToken ?? '';
  }

  @override
  Future request() {
    // TODO: implement request
    throw execute();
  }
}
