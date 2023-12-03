import 'package:itfsd/base/base_bindings.dart';
import 'package:itfsd/presentation/controllers/account/controllers/account_controller.dart';
import 'package:itfsd/presentation/controllers/edit_profile/edit_profile_controller.dart';
import 'package:itfsd/presentation/controllers/farm/farm_controller.dart';
import 'package:itfsd/presentation/controllers/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:itfsd/presentation/controllers/login/login_controller.dart';
import 'package:itfsd/presentation/controllers/news/news_controller.dart';
import 'main_tabview_controller.dart';

class MainTabviewBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<MainTabviewController>(
      () => MainTabviewController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<FarmController>(
      () => FarmController(),
    );
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
      Get.lazyPut<NewsController>(
      () => NewsController(),
    );
  }
}
