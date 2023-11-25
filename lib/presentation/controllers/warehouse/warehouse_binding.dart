import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'warehouse_controller.dart';

class WarehouseBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<WarehouseController>(
      () => WarehouseController(),
    );

  }
}
