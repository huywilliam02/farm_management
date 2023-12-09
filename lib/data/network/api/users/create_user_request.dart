import 'package:dio/dio.dart' as dio;
import '../../../../presentation/page/login/login.dart';
import 'user.dart';

class CreateUserRequest implements APIRequestRepresentable {
  final UserModel model;
  final String? avatarPath;

  CreateUserRequest({required this.model, this.avatarPath});

  @override
  String get url =>
      'http://116.118.49.43:8878/api/users'; // Update with your API endpoint

  @override
  String get endpoint => '/api/users'; // Adjust accordingly

  @override
  String get path => '/create'; // Adjust accordingly

  @override
  HTTPMethod get method => HTTPMethod.post;

  @override
  Map<String, String>? get headers => {
        'Authorization':
            'Bearer ${_getAccessToken()}', // Update with your access token
        'Accept': '*/*',
      };

  @override
  Map<String, String>? get query => null;

  @override
  dynamic get body => {
        'homeTown': model.homeTown,
        'address': model.address,
        'role': model.role,
        'username': model.username,
        'phoneNumber': model.phoneNumber,
        'fullName': model.fullName,
        'jobTitle': model.jobTitle,
        'password': model.password,
        'email': model.email,
        'description': model.description,
      };

  Future<bool> execute() async {
    try {
      var dioRequest = dio.Dio();

      dioRequest.options.headers = headers;
      dioRequest.options.contentType =
          'application/json'; // Set content type to JSON

      var formData = dio.FormData.fromMap(body);

      if (avatarPath != null && avatarPath!.isNotEmpty) {
        final multiPartFile = await dio.MultipartFile.fromFile(
          avatarPath!,
          contentType:
              MediaType('image', 'jpeg'), // Use MediaType from http_parser
        );
        formData.files.add(MapEntry('avatar', multiPartFile)); // Use MapEntry
      }

      await dioRequest.post(
        url,
        data: formData,
      );

      return true;
    } catch (e) {
      print('Error creating user: $e');
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
