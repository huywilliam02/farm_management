import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'fundnumber_controller.dart';

class FundnumberBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<FundnumberController>(
      () => FundnumberController(),
    );
  }
}
