import 'package:itfsd/data/enums/http_method.dart';
import 'package:itfsd/data/model/crops/crops_detail.dart';
import 'package:itfsd/data/network/api_request_representable.dart';
import 'package:itfsd/data/network/providers/api_provider.dart';

import '../../../../presentation/page/login/login.dart';

class SearchCropDetailsRequest implements APIRequestRepresentable {
  final String searchData;

  SearchCropDetailsRequest({required this.searchData});

  @override
  String get url =>
      'http://116.118.49.43:8878/api/crops?order=ASC&page=1&take=10&search=$searchData';

  @override
  String get endpoint => '/api/users'; // Adjust accordingly

  @override
  String get path => ''; // No path needed for GET

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  Map<String, String>? get headers => {
        'Authorization':
            'bearer ${Get.find<StartAppController>().accessToken}', // Update with your access token
        'Accept': 'application/json; charset=UTF-8',
      };

  @override
  Map<String, String>? get query => null;

  @override
  dynamic get body => null;

  Future<List<CropsDetail>> execute() async {
    try {
      var response = await APIProvider.instance.request(this);

      if (response != null && response['data'] != null) {
        final mapData = response['data'].cast<Map<String, dynamic>>();
        List<CropsDetail> listUserDetails = mapData.map<CropsDetail>((json) {
          return CropsDetail.fromJson(json);
        }).toList();
        return listUserDetails;
      } else {
        return [];
      }
    } catch (e) {
      // Handle exceptions
      print('Error searching crop details: $e');
      return [];
    }
  }

  @override
  Future request() {
    // TODO: implement request
    throw execute();
  }
}
