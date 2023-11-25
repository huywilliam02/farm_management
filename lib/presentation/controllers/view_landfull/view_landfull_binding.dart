import 'package:itfsd/base/base_bindings.dart';
import 'package:itfsd/presentation/controllers/view_landfull/tab_moreland_division/land_division_controller.dart';
import 'package:itfsd/presentation/controllers/view_landfull/tabviewland/view_land_controller.dart';
import 'package:get/get.dart';

import 'tab_viewlandfull/view_landfull_controller.dart';

class ViewLandfullBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<ViewLandfullController>(
      () => ViewLandfullController(),
    );
      Get.lazyPut<ViewLandController>(
      () => ViewLandController(),
    );
       Get.lazyPut<LandDivisionController>(
      () => LandDivisionController(),
    );
  }
}
