import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'otherobject_controller.dart';

class OtherobjectBinding extends BaseBindings {
  @override
  void injectService() {
     Get.lazyPut<OtherobjectController>(
      () => OtherobjectController(),
    );
  }
}
