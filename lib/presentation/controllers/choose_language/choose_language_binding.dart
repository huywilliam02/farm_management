import 'package:itfsd/base/base_bindings.dart';
import 'package:get/get.dart';
import 'choose_language_controller.dart';

class ChooseLanguageBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<ChooseLanguageController>(
      () => ChooseLanguageController(),
    );
  }
}
