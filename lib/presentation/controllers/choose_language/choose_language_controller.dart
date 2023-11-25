import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/database/database_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/presentation/page/login/login_choose_page.dart';

class ChooseLanguageController extends BaseController {




  updateLanguage(int index)async{
    switch (index) {
      case 1:
        Get.updateLocale(const Locale("vi"));
        await DatabaseLocal.instance.updateLocale('vi');
        Get.to(()=>const LoginChoosePage());
        break;
         case 2:
        Get.updateLocale(const Locale("en"));
        await DatabaseLocal.instance.updateLocale('en');
        Get.to(()=>const LoginChoosePage());
        break;
      default:
    }
  }
}
