import 'package:get/get.dart';
import 'package:itfsd/base/base_bindings.dart';

import 'document_controller.dart';

class DocumentBinding extends BaseBindings {

  @override
  void injectService() {
    Get.lazyPut<DocumentController>(
          () => DocumentController(),
    );
  }
}
