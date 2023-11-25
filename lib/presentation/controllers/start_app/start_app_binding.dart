import 'package:itfsd/base/base_bindings.dart';
import 'package:get/get.dart';

import 'start_app_controller.dart';

class StartAppBinding extends BaseBindings {
@override
  void injectService() {
    Get.put<StartAppController>(
       StartAppController(), permanent: true
    );
  }

}
