import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';
import 'package:itfsd/presentation/controllers/users/edit_user/edit_user_controller.dart';
import 'users_controller.dart';

class UsersBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<UsersController>(() => UsersController(), fenix: true);
    Get.lazyPut<EditUserController>(
      () => EditUserController(),
    );
  }
}
