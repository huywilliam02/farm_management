import 'dart:io';
import 'package:itfsd/data/database/database_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:itfsd/data/model/login/login_model.dart';
import 'package:path_provider/path_provider.dart';
import 'app/routes/app_pages.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  Hive.initFlutter(dir.path);
  Hive.registerAdapter<LoginModel>(LoginModelAdapter());
  Locale language = await DatabaseLocal.instance.getLocale();
  tz.initializeTimeZones();
  var detroit = tz.getLocation('Asia/Bangkok');
  tz.setLocalLocation(detroit);
  runApp(
    GetMaterialApp(
      title: "ITFSD",
      locale: language,
      fallbackLocale: const Locale('en'), // Ngôn ngữ dự phòng là tiếng Anh
      defaultTransition: Transition.cupertino,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

