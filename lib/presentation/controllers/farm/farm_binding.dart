import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';
import 'package:itfsd/presentation/controllers/farm/farm_controller.dart';

class FarmBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<FarmController>(
      () => FarmController(),
    );
  }
}
