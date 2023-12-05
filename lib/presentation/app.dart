import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/data/database/database_local.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    void initState() async {
      Locale language = await DatabaseLocal.instance.getLocale();
      super.initState();
    }

    return GetMaterialApp(
      title: "ITFSD",
      fallbackLocale: const Locale('en'), // Ngôn ngữ dự phòng là tiếng Anh
      defaultTransition: Transition.cupertino,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: const [
        Locale('en', ''),
        Locale('zh', ''),
        Locale('es', ''),
        Locale('de', ''),
        Locale('pt', ''),
        Locale('ar', ''),
        Locale('fr', ''),
        Locale('ja', ''),
        Locale('ru', ''),
        Locale('ur', ''),
        Locale('hi', ''),
        Locale('vi', ''),
        Locale('id', ''),
        Locale('bn', ''),
        Locale('ta', ''),
        Locale('te', ''),
        Locale('tr', ''),
        Locale('ko', ''),
        Locale('pa', ''),
        Locale('it', ''),
      ],
      localizationsDelegates: const [
        // AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
