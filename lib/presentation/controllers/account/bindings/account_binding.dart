import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import '../controllers/account_controller.dart';

class AccountBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<AccountController>(
          () => AccountController(),
    );
  }
}
