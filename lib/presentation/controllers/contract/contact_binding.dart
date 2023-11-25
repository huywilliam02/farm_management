import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'contact_controller.dart';

class ContactBinding extends BaseBindings {

  @override
  void injectService() {
     Get.lazyPut<ContactController>(
      () => ContactController(),
    );
  }
}
