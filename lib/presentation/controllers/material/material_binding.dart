import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'material_controller.dart';

class MaterialBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<MaterialController>(
      () => MaterialController(),
    );
  }
}
