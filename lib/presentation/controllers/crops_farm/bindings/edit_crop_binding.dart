import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';
import 'package:itfsd/presentation/controllers/crops_farm/controllers/edit_crop_controller.dart';

class EditCropBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<EditCropController>(
      () => EditCropController(),
    );
  }
}
