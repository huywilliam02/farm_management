import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'planttracking_controller.dart';

class PlanttrackingBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<PlanttrackingController>(
      () => PlanttrackingController(),
    );
  }
}
