import 'package:get/get.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/model/news/news_model.dart';
import 'package:itfsd/data/network/api/news/remote_service.dart';

class NewsController extends BaseController {
  //TODO: Implement NewsController

  final count = 0.obs;
  // var newsArticles = <NewsArticle>[].obs;
  var isLoading = true.obs;
  var newsArticles = <NewsArticle>[
    NewsArticle(
      title: "News Title",
      description: "News Description",
      url: "https://www.google.com",
      publishedAt: DateTime.now(),
      content: "News Content",
      urlToImage:
          "https://images.unsplash.com/photo-1593433605785-5658abf49305?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    ),
  ].obs;
  @override
  Future<void> onInit() async {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      // var articles = await RemoteNewsService.fetchNewsArticles();
      // if (articles != null) {
      //   newsArticles(articles);
      // }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
