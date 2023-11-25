import 'package:itfsd/base/base_bindings.dart';
import 'package:itfsd/presentation/controllers/area/more_area/more_land_controller.dart';
import 'package:itfsd/presentation/controllers/area/view_more_area/view_more_land_controller.dart';
import 'package:get/get.dart';

import 'view_area/view_area_controller.dart';

class ViewAreaBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<ViewAreaController>(
      () => ViewAreaController(),
    );
      Get.lazyPut<ViewMoreLandController>(
      () => ViewMoreLandController(),
    );
        Get.lazyPut<MoreLandController>(
      () => MoreLandController(),
    );
  }
}
