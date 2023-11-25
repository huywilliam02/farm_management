import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'workinday_controller.dart';

class WorkindayBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<WorkindayController>(
      () => WorkindayController(),
    );
  }
}
