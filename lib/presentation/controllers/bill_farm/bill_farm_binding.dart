import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'bill_farm_controller.dart';

class BillFarmBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<BillFarmController>(
      () => BillFarmController(),
    );
  }
}
