import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';
import 'package:itfsd/presentation/controllers/users/edit_user/edit_user_controller.dart';
import 'package:itfsd/presentation/controllers/users/users_controller.dart';


class EditUserBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<EditUserController>(
      () => EditUserController(),
    );
    Get.lazyPut<UsersController>(
          () => UsersController(),
    );
  }
}
