import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'client_farm_controller.dart';

class ClientFarmBinding extends BaseBindings {
 
  
  @override
  void injectService() {
    Get.lazyPut<ClientFarmController>(
      () => ClientFarmController(),
    );
  }
}
