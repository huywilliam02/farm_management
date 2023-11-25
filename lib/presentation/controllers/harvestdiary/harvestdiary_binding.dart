import 'package:get/get.dart';

import 'harvestdiary_controller.dart';

class HarvestdiaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HarvestdiaryController>(
      () => HarvestdiaryController(),
    );
  }
}
