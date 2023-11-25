import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'storewarehouse_controller.dart';

class StorewarehouseBinding extends BaseBindings {

  @override
  void injectService() {
      Get.lazyPut<StorewarehouseController>(
      () => StorewarehouseController(),
    );
  }
}
