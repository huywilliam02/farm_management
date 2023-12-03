import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';
import 'package:itfsd/presentation/controllers/news/news_controller.dart';

class NewsBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<NewsController>(
      () => NewsController(),
    );
  }
}
