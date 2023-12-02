import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/data/model/login/login_model.dart';
import 'package:itfsd/data/model/sign_up/sign_up.dart';
import 'package:itfsd/presentation/controllers/agricultural_products/agricultural_products_constant.dart';

// import 'package:intl/intl.dart';
// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart';

class SignUpController extends BaseController {
  Rx<String> usernameInput = "".obs;
  Rx<String> fullnameInput = "".obs;
  Rx<String> passwordInput = "".obs;
  Rx<String> rePasswordInput = "".obs;
  Rx<String> email = "".obs;
  Rx<bool> isLoading = false.obs;
  Rx<String> erruserNameInput = "".obs;
  Rx<String> errPasswordInput = "".obs;
  Rx<String> errfullnameInput = "".obs;
  Rx<bool> enableButton = false.obs;
  Rx<bool> checkpassword = true.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setNameInput(String? value) {
    if (value != null) {
      checkName(value);
      usernameInput.value = value;
    }
  }

  setPasswordInput(String? value) {
    if (value != null) {
      passwordInput.value = value;
      checkPassword();
    }
  }

  setRePasswordInput(String? value) {
    if (value != null) {
      rePasswordInput.value = value;
      checkPassword();
    }
  }

  setEmailInput(String? value) {
    if (value != null) {
      email.value = value;
      checkEmail(value);
    }
  }

  checkEmail(String value) {
      if (value == "") {
      errfullnameInput.value = "Name must not empty";
    } else {
      errfullnameInput.value = "";
    }
    checkEnableButton();
  }

  checkPassword() {
    if (passwordInput.value.length < 8) {
      errPasswordInput.value = "Password must be more than 8 character";
    } else if (passwordInput != rePasswordInput) {
      errPasswordInput.value = "Repassword not the same";
    } else {
      errPasswordInput.value = "";
    }
    checkEnableButton();
  }

  checkName(String value) {
    if (value == "") {
      erruserNameInput.value = "Name must not empty";
    } else {
      erruserNameInput.value = "";
    }
    checkEnableButton();
  }

  bool checkEmpty() {
    if (usernameInput.isNotEmpty &&
        passwordInput.isNotEmpty &&
        rePasswordInput.isNotEmpty &&
        email.isNotEmpty) {
      return true;
    }
    return false;
  }

  checkEnableButton() {
    if (erruserNameInput.isEmpty &&
        errfullnameInput.isEmpty &&
        errPasswordInput.isEmpty &&
        checkEmpty()) {
      enableButton(true);
    } else {
      enableButton(false);
    }
  }
  //
  // signUp() async {
  //   isLoading(true);
  //   if (errfullnameInput.isEmpty && errPasswordInput.isEmpty && erruserNameInput.isEmpty) {
  //     SignUpModel signUpModel = SignUpModel(
  //       username: usernameInput.value,
  //       fullName: fullnameInput.value,
  //       password: passwordInput.value,
  //     );
  //     try {
  //       LoginModel? loginModel = await SignUpApi.register(signUpModel);
  //       if (loginModel != null) {
  //         Get.find<LoginController>().loginModel.value = loginModel;
  //         // Get.find<LoginController>().accessToken =
  //         //     await DatabaseLocal.instance.getJwtToken();
  //         // await DatabaseLocal.instance.reNewLoginModel(loginModel);
  //         Get.offAllNamed(Routes.MAIN_TABVIEW);
  //         Get.snackbar("Notification", "hel", backgroundColor: Colors.white);
  //       }
  //     } catch (e) {
  //       enableButton(false);
  //       isLoading(false);
  //       Get.offNamed(Routes.SIGN_UP);
  //       Get.snackbar("Thông báo", "${e.toString().split("Exception: ")[1]}".tr,
  //           backgroundColor: ColorConstant.white);
  //     } finally {
  //       isLoading(false);
  //     }
  //   }
  // }
}
