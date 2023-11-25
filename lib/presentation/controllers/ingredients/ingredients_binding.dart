import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'ingredients_controller.dart';

class IngredientsBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<IngredientsController>(
          () => IngredientsController(),
    );
  }
}
