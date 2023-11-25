import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'chart_resources_controller.dart';

class ChartResourcesBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<ChartResourcesController>(
          () => ChartResourcesController(),
    );
  }
}
