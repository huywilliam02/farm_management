import 'package:itfsd/base/base_bindings.dart';
import 'package:get/get.dart';

import 'library_image_controller.dart';

class LibraryImageBinding extends BaseBindings {
  @override
  void injectService() {
    RxList<String> images =Get.arguments as RxList<String>;
    Get.lazyPut<LibraryImageController>(
      () => LibraryImageController(images:images),
    );
  }
}
