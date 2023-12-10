import 'package:itfsd/data/enums/http_method.dart';
import 'package:itfsd/data/network/api_request_representable.dart';
import 'package:itfsd/data/network/providers/api_provider.dart';

import '../../../../presentation/page/login/login.dart';

class DeleteCropRequest implements APIRequestRepresentable {
  final String cropId;

  DeleteCropRequest({required this.cropId});

  @override
  String get url =>
      'http://116.118.49.43:8878/api/crops?cropId=$cropId'; // Update with your API endpoint

  @override
  String get endpoint => '/api/users'; // Adjust accordingly

  @override
  String get path => ''; // No path needed for DELETE

  @override
  HTTPMethod get method => HTTPMethod.delete;

  @override
  Map<String, String>? get headers => {
    'Authorization':
    'Bearer ${_getAccessToken()}', // Update with your access token
    'Accept': '*/*',
  };

  @override
  Map<String, String>? get query => null;

  @override
  dynamic get body => null;

  Future<bool> execute() async {
    try {
      var response = await APIProvider.instance.request(this);

      if (response != null && response['id'] != null) {
        // User deleted successfully
        return true;
      } else {
        // Handle other response scenarios if needed
        print('Error deleting user. Response: $response');
        return false;
      }
    } catch (e) {
      // Handle exceptions
      print('Error deleting crop: $e');
      return false;
    }
  }

  @override
  Future request() async {
    return execute();
  }

  String _getAccessToken() {
    // Safely retrieve the access token from the controller
    final startAppController = Get.find<StartAppController>();
    return startAppController.accessToken ?? '';
  }
}
