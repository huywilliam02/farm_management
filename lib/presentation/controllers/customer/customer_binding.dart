import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'customer_controller.dart';

class CustomerBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<CustomerController>(
      () => CustomerController(),
    );
  }
}
