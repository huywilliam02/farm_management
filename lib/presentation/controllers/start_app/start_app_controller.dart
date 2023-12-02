import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/database/database_local.dart';
import 'package:itfsd/data/network/api/login/login_api.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';

class StartAppController extends BaseController {
  String accessToken = '';
  late StreamSubscription streamConnect;
  Rx<bool> hasInternet = false.obs;
  @override
  void onInit() async {
  
    await getConnection();
    try {
      streamConnect = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          hasInternet(true);
        } else if (result == ConnectivityResult.none) {
          hasInternet(false);
        }
      });
      // await refeshToken();

      await refeshToken();
    } catch (e) {
      Get.dialog(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Material(
                    child: Column(
                      children: [
                        Text(
                          "Lỗi hiện tại không có mạng !",
                          style: GoogleFonts.roboto(
                            // textStyle: Theme.of(context).textTheme.displayLarge,
                            textStyle: TextStyleConstant.grey16RobotoBold,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Vui lòng kết nối Internet",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyleConstant.grey16RobotoBold,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        //Buttons
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: const Color(0xFFFFFFFF),
                                  backgroundColor: Colors.white,
                                  minimumSize: const Size(0, 45),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  if (Platform.isAndroid) {
                                    SystemNavigator.pop();
                                  } else if (Platform.isIOS) {
                                    exit(0);
                                  }
                                },
                                child: Text(
                                  'Thoát',
                                  style: GoogleFonts.roboto(
                                    // textStyle: Theme.of(context).textTheme.displayLarge,
                                    textStyle:
                                        TextStyleConstant.grey16RobotoBold,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: const Color(0xFFFFFFFF),
                                  backgroundColor: Colors.green,
                                  minimumSize: const Size(0, 45),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Tiếp tục',
                                  style: GoogleFonts.roboto(
                                    // textStyle: Theme.of(context).textTheme.displayLarge,
                                    textStyle: TextStyleConstant.white16Roboto,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    super.onInit();
    // log(refeshToken().toString());
  }



  Future<bool> getConnection() async {
    bool isConnection = await InternetConnectionChecker().hasConnection;
    if (isConnection) {
      hasInternet(true);
      return Future.value(true);
    } else {
      hasInternet(false);
      return Future.value(false);
    }
  }

  refeshToken() async {
    
    // Obtain shared preferences.
    // String? token = await DatabaseLocal.instance.getRefeshToken();
    String? token = await DatabaseLocal.instance.getaccessToken();
    String? refeshToken = await DatabaseLocal.instance.getRefeshToken();
    if (token == null || refeshToken == null) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      //Goi refeshtokenapu
      accessToken = token;
      dynamic response = await LoginApi.refeshToken(refeshToken);
      Map data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        // accessToken = data["accessToken"];
        accessToken = data["accessToken"];
        await DatabaseLocal.instance.setJwtToken(accessToken);
        Get.offAllNamed(Routes.MAIN_TABVIEW);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      
      }
    }
  }
}
