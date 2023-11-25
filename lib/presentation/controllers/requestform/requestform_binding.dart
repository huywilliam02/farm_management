import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';
import 'package:itfsd/presentation/controllers/requestform/request_form_controller.dart';


class RequestformBinding extends BaseBindings {
  @override
  void injectService() {
     Get.lazyPut<RequestformController>(
      () => RequestformController(),
    );
  }
}
