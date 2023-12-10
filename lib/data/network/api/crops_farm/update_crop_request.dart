import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:itfsd/data/enums/http_method.dart';
import 'package:itfsd/data/model/crops/crop_model.dart';
import 'package:itfsd/data/model/crops/crops_detail.dart';
import 'package:itfsd/data/network/api_request_representable.dart';

import '../../../../presentation/page/login/login.dart';

class UpdateCropRequest implements APIRequestRepresentable {
  final String? cropId;
  final CropsFarmModel formEdit;

  UpdateCropRequest({required this.cropId, required this.formEdit});

  @override
  String get url => 'http://116.118.49.43:8878/api/crops?cropId=$cropId';

  @override
  String get endpoint => '/api/crops?cropId'; // Adjust accordingly

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
  dynamic get body => {
        "name": formEdit.name,
        "disease": formEdit.disease,
        "growth": formEdit.growth,
        "use": formEdit.use,
        "harvest": formEdit.harvest,
        "price": formEdit.price,
        "groupCrop": formEdit.groupCrop,
      };

  Future<bool> execute() async {
    try {
      var dio = Dio(); // Create a Dio instance
      var response = await dio.put(
        'http://116.118.49.43:8878/api/crops?cropId=$cropId',
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
        print('Error updating crop. Response: ${response.data}');
        return false;
      }
    } catch (e) {
      // Handle exceptions
      print('Error updating crop: $e');

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
