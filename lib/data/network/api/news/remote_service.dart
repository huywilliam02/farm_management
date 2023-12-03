import 'package:http/http.dart' as http;
import 'package:itfsd/data/model/news/news_model.dart';

class RemoteNewsService {
  static var client = http.Client();

  // static Future<List<NewsArticle>?> fetchNewsArticles() async {
  //   var apiKey = "8124ff4f0b714774a0cf22eaa50b1999";
  //   var response = await client.get(Uri.parse(
  //       "https://newsapi.org/v2/everything?q=tesla&from=2023-11-03&sortBy=publishedAt&apiKey=8124ff4f0b714774a0cf22eaa50b1999"));
  //   if (response.statusCode == 200) {
  //     return newsArticleFromJson(response.body);
  //   } else {
  //     return null;
  //   }
  // }
}
