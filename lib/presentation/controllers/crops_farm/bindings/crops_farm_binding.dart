import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';
import 'package:itfsd/presentation/controllers/crops_farm/controllers/crops_farm_controller.dart';

class CropsFarmBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<CropsFarmController>(
      () => CropsFarmController(),
    );
  }
}
