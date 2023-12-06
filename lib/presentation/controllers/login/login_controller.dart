import 'package:flutter/material.dart';
import 'package:itfsd/presentation/page/login/login.dart';

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

  @override
  void onClose() {
    streamConnect.cancel();
    super.onClose();
  }

  Future<bool> getConnection() async {
    bool isConnection = await InternetConnectionChecker().hasConnection;
    hasInternet(isConnection);
    return isConnection;
  }

  void onBackLoginPage() {
    username("");
    password("");
    validateErrusername("");
    validateErrPassword("");
    usernameController.text = "";
    passwordController.text = "";
  }

  void validateUserName(String value) {
    validateErrusername(value.isEmpty ? "Vui lòng nhập tài khoản" : "");
  }

  void validatePassword(String value) {
    validateErrPassword(value.isEmpty ? "Mật khẩu phải có 8 ký tự" : "");
  }

  void setUserNameInput(String? value) {
    if (value != null) {
      validateUserName(value);
      username(value);
    }
  }

  void setValuePassword(String? value) {
    if (value != null) {
      validatePassword(value);
      password(value);
    }
  }

  Future<void> login() async {
    isLoading(true);
    try {
      await DatabaseLocal.instance.removeJwtToken();
      validateUserName(username.value);
      validatePassword(password.value);

      if (validateErrusername.value.isEmpty &&
          validateErrPassword.value.isEmpty) {
        String response = await LoginApi.login(username.value, password.value);
        log(response);
        Map data = jsonDecode(response);
        Get.find<StartAppController>().accessToken = data['accessToken'];
        await DatabaseLocal.instance.setJwtToken(data['accessToken']);
        await DatabaseLocal.instance.saveRefeshToken(data['refreshToken']);

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
      }
    } catch (e) {
      Get.snackbar(
        "Thông báo",
        "Đăng nhập thất bại",
        backgroundColor: ColorConstant.white,
      );
    } finally {
      isLoading(false);
    }
  }

  void logout() {
    Get.offAllNamed(Routes.START_APP);
  }
}
