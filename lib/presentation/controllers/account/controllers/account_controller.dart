import 'package:flutter/material.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';
import 'package:itfsd/data/model/editprofile/edit_profile.dart';
import 'package:itfsd/data/network/api/login/login_api.dart';
import 'package:itfsd/presentation/controllers/users/edit_user/edit_user_controller.dart';
import 'package:itfsd/presentation/page/account/account.dart';
import 'package:itfsd/presentation/page/users/edit_user/edit_user_view.dart';

class AccountController extends BaseController {
  //TODO: Implement AccountController
  bool isDarkMode = false;
  Rx<bool> isLoading = false.obs;
  Rx<LoginModel?> loginModel = Rx<LoginModel?>(null);
  Rx<String> id = "".obs;

  Rx<bool> isLocked = false.obs;

  Rx<String> userName = "".obs;
  Rx<String> fullName = "".obs;
  Rx<String> role = "".obs;
  String accessToken = "";
  RoleConstants roleConstants = RoleConstants();

  Rx<String> fullname = "".obs;
  Rx<String> email = "".obs;
  Rx<String> phoneNumber = "".obs;
  Rx<String> description = "".obs;
  Rx<String> avatar = "".obs;
  Rx<String> jobTitle = "".obs;
  Rx<String> homeTown = "".obs;
  Rx<String> address = "".obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController homeTownController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Future<void> onInit() async {
    try {
      // Wait until the LoginController is initialized
      getEditUser();
      // Now you can safely access loginModel.value
    } catch (e) {
      print("Error during initialization: $e");
    }
    super.onInit();
  }

  Future<void> getEditUser() async {
    isLoading.value = true;
    try {
      loginModel.value = await EditProfilelApi.getDataUser(accessToken);
      if (loginModel.value != null) {
        updateUserData(loginModel.value!);
      } else {
        print("Error: loginModel.value is null");
      }
    } catch (e) {
      print("Error fetching user data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void showData(LoginModel model) {
    loginModel.value = model;
    // print('showData is called with userId: $model');
    //
    // // Rest of the code...
    //
    // print('fullnameController: ${fullNameController.text}');
    // print('avatar: ${avatar.value}');
    //
    // // Reset the form fields
    // // refreshForm();
    //
    // // Populate form fields with data from the selected user
    // fullNameController.text = model.fullName ?? "";
    // phoneNumberController.text = model.phoneNumber ?? "";
    // jobTitleController.text = model.jobTitle ?? "";
    // descriptionController.text = model.description ?? "";
    // avatar.value = HttpNetWorkUrlApi.baseURL + model.avatar ?? "";
    Get.to(
      () => EditProfileView(
        userId: model.id,
      ),
    );
  }

  refreshForm() {
    fullNameController.text = '';
    emailController.text = "";
    phoneNumberController.text = "";
    jobTitleController.text = "";
    descriptionController.text = "";
    avatar.value = "";
  }

  void updateUserData(LoginModel user) {
    id.value = user.id!;
    userName.value = user.username ?? "";
    fullName.value = user.fullName ?? "";
    role.value = user.role ?? "";
    avatar.value = user.avatar ?? "";
    email.value = user.email ?? "";
    phoneNumber.value = user.phoneNumber ?? "";
    homeTown.value = user.homeTown ?? "";
    address.value = user.address ?? "";
    jobTitle.value = user.jobTitle ?? "";
    description.value = user.description ?? "";
    isLocked.value = user.isLocked ?? false;
  }

  onClickButtonEditProfile() {
    if (Get.find<LoginController>().hasInternet.isTrue) {
      Get.toNamed(Routes.EDIT_PROFILE);
    } else {
      DevUtils.showSnackbarMessage(
          "Thông báo", "Lỗi! kết nối mạng", Colors.redAccent);
    }
  }

  logout() async {
    await DatabaseLocal.instance.removeJwtToken();
    Get.offAllNamed(Routes.LOGIN);
  }
}
