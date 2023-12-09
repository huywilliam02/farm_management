// File: get_all_data_users_request.dart
import '../../../../presentation/page/login/login.dart';
import 'user.dart';

class GetAllDataUsersRequest implements APIRequestRepresentable {
  final int indexPage;

  GetAllDataUsersRequest(this.indexPage);

  @override
  String get url =>
      'http://116.118.49.43:8878/api/users?order=ASC&page=$indexPage&take=10';

  @override
  String get endpoint => 'users'; // You can define an endpoint if needed

  @override
  String get path => '/api/users'; // You can define the path if needed

  @override
  HTTPMethod get method => HTTPMethod.get;

  @override
  Map<String, String>? get headers => {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${_getAccessToken()}',
      };

  @override
  Map<String, String>? get query => null;

  @override
  get body => null;

  @override
  Future<List<UserDetailsModel>> request() async {
    try {
      final response = await APIProvider.instance.request(this);
      return _returnResponse(response);
    } catch (e) {
      // Propagate the exception
      throw e;
    }
  }

  _returnResponse(dynamic response) {
    try {
      // Check if the response is a Map
      if (response is Map<String, dynamic>) {
        // Check if 'data' property is present
        if (response.containsKey('data')) {
          final List<dynamic> data = response['data'];
          return data
              .map<UserDetailsModel>((json) => UserDetailsModel.fromJson(json))
              .toList();
        } else {
          // Handle situations where 'data' is not present
          throw Exception('Failed to load user data. Data not present.');
        }
      } else {
        // Handle situations where response is not a Map
        throw Exception(
            'Failed to load user data. Unexpected response format.');
      }
    } catch (e) {
      // Handle other exceptions or errors
      throw Exception('Failed to load user data. Exception occurred. $e');
    }
  }

  String _getAccessToken() {
    // Safely retrieve the access token from the controller
    final startAppController = Get.find<StartAppController>();
    return startAppController.accessToken ?? '';
  }
}
