import 'package:itfsd/base/base_bindings.dart';
import 'package:itfsd/presentation/controllers/login/login_controller.dart';

import 'package:get/get.dart';

class LoginBinding extends BaseBindings {
  @override
  void injectService() {
     Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
