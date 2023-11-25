import 'package:itfsd/base/base_bindings.dart';
import 'package:get/get.dart';

import 'farming_calendar_controller.dart';

class FarmingCalendarBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<FarmingCalendarController>(
      () => FarmingCalendarController(),
    );
  }
}
