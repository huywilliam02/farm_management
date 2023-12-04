import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'create_user_controller.dart';

class CreateUserBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<CreateUserController>(
      () => CreateUserController(),
    );
  }
}
