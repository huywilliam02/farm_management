import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'unitfarm_controller.dart';

class UnitfarmBinding extends BaseBindings {
  @override
  void injectService() {
     Get.lazyPut<UnitfarmController>(
      () => UnitfarmController(),
    );
  }
}
