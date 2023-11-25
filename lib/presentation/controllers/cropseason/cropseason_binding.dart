import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'cropseason_controller.dart';

class CropseasonBinding extends BaseBindings {

  @override
  void injectService() {
  Get.lazyPut<CropseasonController>(
      () => CropseasonController(),
    );
  }
}
