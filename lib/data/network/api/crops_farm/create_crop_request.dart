import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';
import 'package:itfsd/data/enums/http_method.dart';
import 'package:itfsd/data/model/crops/crop_model.dart';
import 'package:itfsd/data/network/api_request_representable.dart';
import '../../../../presentation/page/login/login.dart';

class CreateCropRequest implements APIRequestRepresentable {
  final CropsFarmModel model;
  List<String> listimagesPath;

  CreateCropRequest({required this.model, required this.listimagesPath});

  @override
  String get url =>
      'http://116.118.49.43:8878/api/crops'; // Update with your API endpoint

  @override
  String get endpoint => '/api/crops'; // Adjust accordingly

  @override
  String get path => '/create'; // Adjust accordingly

  @override
  HTTPMethod get method => HTTPMethod.post;

  @override
  Map<String, String>? get headers => {
        'Authorization':
            'Bearer ${_getAccessToken()}', // Update with your access token
        'Accept': 'application/json',
      };

  @override
  Map<String, String>? get query => null;

  @override
  dynamic get body => {
        "name": model.name,
        "disease": model.disease,
        "growth": model.growth,
        "use": model.use,
        "harvest": model.harvest,
        "price": model.price,
        "groupCrop": model.groupCrop,
      };

  Future<bool> execute() async {
    try {
      var dioRequest = dio.Dio();

      dioRequest.options.headers = headers;
      dioRequest.options.contentType =
          'multipart/form-data'; // Set content type to JSON

      var formData = dio.FormData.fromMap(body);
      await Future.forEach(listimagesPath, (String path) async {
        final multiPartFile = await dio.MultipartFile.fromFile(
          path,
          contentType: MediaType("image", "jpeg"),
        );
        formData.files.add(MapEntry('images', multiPartFile));
      });
      // if (listimagesPath != null && listimagesPath!.isNotEmpty) {
      //   final multiPartFile = await dio.MultipartFile.fromFile(
      //     listimagesPath!,
      //     contentType:
      //         MediaType('image', 'jpeg'), // Use MediaType from http_parser
      //   );
      //   formData.files.add(MapEntry('avatar', multiPartFile)); // Use MapEntry
      // }

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
