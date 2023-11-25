import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/model/login/login_model.dart';
import 'package:itfsd/data/network/api/login/login_api.dart';
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/database/database_local.dart';
import '../../../app/core/constants/app_constants.dart';

class LoginController extends BaseController {
  Rx<bool> isLoading = false.obs;

  Rx<String> username = "".obs;
  Rx<String> password = "".obs;
  Rx<bool> checkpassword = true.obs;
  Rx<String> validateErrusername = "".obs;
  Rx<String> validateErrPassword = "".obs;
  Rx<bool> hasInternet = false.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<LoginModel?> loginModel = Rx<LoginModel?>(null);
  late StreamSubscription streamConnect;
  // Rx<bool> hasInternet = false.obs;
  late String farmId;
  @override
  void onInit() async {
    await getConnection();
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

    usernameController = TextEditingController();
    passwordController = TextEditingController();

    super.onInit();
  }

//LoginController-Module Login
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

  void onBackLoginPage() {
    username("");
    password("");
    validateErrusername("");
    validateErrPassword("");
    usernameController.text = "";
    passwordController.text = "";
  }

  validateUserName(String value) {
    if (value == "") {
      validateErrusername.value = "Vui lòng nhập tài khoản";
    } else {
      validateErrusername.value = "";
    }
  }

  validatePassword(String value) {
    if (value.isEmpty) {
      validateErrPassword.value = "Mật khẩu phải có 8 ký tự";
    } else {
      validateErrPassword.value = "";
    }
  }

  setUserNameInput(String? value) {
    if (value != null) {
      validateUserName(value);
      username.value = value;
    }
  }

  setValuePassword(String? value) {
    if (value != null) {
      validatePassword(value);
      password.value = value;
    }
  }

  login() async {
    isLoading(true);
    try {
      await DatabaseLocal.instance.removeJwtToken();
      validateUserName(username.value);
      validatePassword(password.value);
      if (validateErrusername.value == "" && validateErrPassword.value == "") {
        String response = await LoginApi.login(username.value, password.value);
        log(response);
        Map data = jsonDecode(response);
        Get.find<StartAppController>().accessToken = data['accessToken'];
        await DatabaseLocal.instance.setJwtToken(data['accessToken']);
        await DatabaseLocal.instance.saveRefeshToken(data['refreshToken']);

        // if (accessToken != "") {
        //   await DatabaseLocal.instance.reNewLoginModel(lo);
        //   Get.offAllNamed(Routes.MAIN_TABVIEW);
        Get.offAllNamed(Routes.MAIN_TABVIEW);
        Get.snackbar(
          "Thông báo",
          "Đăng nhập thành công",
          icon: const Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          borderRadius: 20,
          margin: const EdgeInsets.all(15),
          colorText: Colors.white,
          duration: const Duration(seconds: 5),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          forwardAnimationCurve: Curves.easeOutBack,
        );

        // }
      }
    } catch (e) {
      Get.snackbar("Thông báo", "Dang nhap that bai",
          backgroundColor: ColorConstant.white);
    } finally {
      isLoading(false);
    }
  }

  logout() async {
    // await DatabaseLocal.instance.removeJwtToken();
    Get.offAllNamed(Routes.START_APP);
  }
}
