import 'user.dart';

class SearchUserDetailsRequest implements APIRequestRepresentable {
  final String searchData;

  SearchUserDetailsRequest({required this.searchData});

  @override
  String get url =>
      'http://116.118.49.43:8878/api/users?order=ASC&page=1&take=10&search=$searchData';

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
            'Bearer YourAccessTokenHere', // Update with your access token
        'Accept': 'application/json; charset=UTF-8',
      };

  @override
  Map<String, String>? get query => null;

  @override
  dynamic get body => null;

  Future<List<UserDetailsModel>> execute() async {
    try {
      var response = await APIProvider.instance.request(this);

      if (response != null && response['data'] != null) {
        final mapData = response['data'].cast<Map<String, dynamic>>();
        List<UserDetailsModel> listUserDetails =
            mapData.map<UserDetailsModel>((json) {
          return UserDetailsModel.fromJson(json);
        }).toList();
        return listUserDetails;
      } else {
        return [];
      }
    } catch (e) {
      // Handle exceptions
      print('Error searching user details: $e');
      return [];
    }
  }

  @override
  Future request() {
    // TODO: implement request
    throw execute();
  }
}
