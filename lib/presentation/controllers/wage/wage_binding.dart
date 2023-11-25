import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';
import 'package:itfsd/presentation/controllers/wage/workersalarycontrollers/workersalary_controller.dart';

import 'wage_controller.dart';

class WageBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<WageController>(
      () => WageController(),
    );
    Get.lazyPut<WorkersalaryController>(
      () => WorkersalaryController(),
    );
  }
}
