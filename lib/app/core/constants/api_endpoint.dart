class APIEndpoint {
  static String get newsapi => "https://newsapi.org/v2";
}

class HttpNetWorkUrlApi {
  //link host
  static String baseURL = 'http://116.118.49.43:8878/';
  static String updatacrops = 'http://116.118.49.43:8878/uploads/crops/';
  static String login = '${baseURL}api/auth/login'; //login
  static String refeshToken =
      '${baseURL}api/auth/refresh-tokens'; //get refeshToken
  static String createArea = '$baseURL/api/area?farmId';

  static String createIngredients= '${baseURL}api/ingredients';
  static String DeleteIngredients = '${baseURL}api/ingredients?id';
}

