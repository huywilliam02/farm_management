import 'package:itfsd/base/base_bindings.dart';
import 'package:get/get.dart';
import 'package:itfsd/presentation/controllers/account/controllers/account_controller.dart';

import 'edit_profile_controller.dart';

class EditProfileBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
  }
}
