import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'supplier_controller.dart';

class SupplierBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<SupplierController>(
      () => SupplierController(),
    );
  }
}
