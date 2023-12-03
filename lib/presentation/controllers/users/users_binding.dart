import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'users_controller.dart';

class UsersBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<UsersController>(
          () => UsersController(),
    );
  }
}
