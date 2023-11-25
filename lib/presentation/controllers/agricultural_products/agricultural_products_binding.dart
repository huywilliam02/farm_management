import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'agricultural_products_controller.dart';

class AgriculturalProductsBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<AgriculturalProductsController>(
          () => AgriculturalProductsController(),
    );
  }
}
