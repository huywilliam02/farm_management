import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';
import 'package:itfsd/presentation/controllers/sign_up/sign_up_controller.dart';

class SignUpBinding extends BaseBindings {
  
  @override
  void injectService() {
     Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
  }
}
