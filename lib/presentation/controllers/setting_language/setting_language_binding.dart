import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'setting_language_controller.dart';

class SettingLanguageBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<SettingLanguageController>(
          () => SettingLanguageController(),
    );
  }
}
