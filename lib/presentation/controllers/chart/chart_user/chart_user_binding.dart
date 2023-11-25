import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'chart_user_controller.dart';

class ChartUserBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<ChartUserController>(
          () => ChartUserController(),
    );
  }
}
