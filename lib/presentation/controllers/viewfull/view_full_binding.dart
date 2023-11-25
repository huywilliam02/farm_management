import 'package:itfsd/base/base_bindings.dart';
import 'package:get/get.dart';

import 'view_full_controller.dart';

class ViewFullBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<ViewFullController>(
      () => ViewFullController(),
    );
  }
}
