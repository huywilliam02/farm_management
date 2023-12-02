import 'package:get/get.dart';

import 'chat_ai_controller.dart';

class ChatAiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatAiController>(
      () => ChatAiController(),
    );
  }
}
