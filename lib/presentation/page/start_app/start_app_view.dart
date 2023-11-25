import 'package:itfsd/base/base_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/presentation/page/login/splash.dart';

import '../../controllers/start_app/start_app_controller.dart';

class StartAppView extends BaseView<StartAppController> {
  const StartAppView({super.key});

  @override
  Widget buildView(BuildContext context) {
    print(Get.deviceLocale.toString());
    return const SplashStart();
  }
}
