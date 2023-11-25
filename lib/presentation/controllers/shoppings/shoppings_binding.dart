import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';
import 'shoppings_controller.dart';

class ShoppingsBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<ShoppingsController>(
      () => ShoppingsController(),
    );
  }
}
