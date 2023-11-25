import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'chart_quanlity_controller.dart';

class ChartQuanlityBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<ChartQuanlityController>(
          () => ChartQuanlityController(),
    );
  }
}
