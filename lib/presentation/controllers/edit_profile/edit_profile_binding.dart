import 'package:itfsd/base/base_bindings.dart';
import 'package:get/get.dart';

import 'edit_profile_controller.dart';

class EditProfileBinding extends BaseBindings {
  @override
  void injectService() {
     Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
    );
  }
}
