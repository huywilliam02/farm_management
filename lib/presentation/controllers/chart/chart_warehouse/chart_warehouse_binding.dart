import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'chart_warehouse_controller.dart';

class ChartWarehouseBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<ChartWarehouseController>(
      () => ChartWarehouseController(),
    );
  }
}
