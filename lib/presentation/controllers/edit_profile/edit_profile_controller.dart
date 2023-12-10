import 'dart:io';

import 'package:itfsd/app/core/shared/role/role_constants.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/database/database_local.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:itfsd/data/model/editprofile/edit_profile.dart';
import 'package:itfsd/data/model/login/login_model.dart';
import 'package:itfsd/data/model/users/user_details.dart';
import 'package:itfsd/data/network/api/edit_profile/editprofile.dart';
import 'package:itfsd/data/network/api/users/get_all_data_users_request.dart';
import 'package:itfsd/data/network/api/users/update_user_request.dart';
import 'package:itfsd/data/network/api/users/user.dart';
import 'package:itfsd/presentation/page/account/account.dart';
import 'package:itfsd/presentation/page/login/login.dart';
import 'package:itfsd/presentation/page/users/edit_user/edit_user_view.dart';
import 'package:itfsd/presentation/page/users/user.dart';

class EditProfileController extends BaseController {
  //TODO: Implement UsersController
  String accessToken = "";
  Rx<String> username = "".obs;
  Rx<String> password = "".obs;
  Rx<String> fullname = "".obs;
  Rx<String> email = "".obs;
  Rx<String> phoneNumber = "".obs;
  Rx<String> description = "".obs;
  Rx<String> avatar = "".obs;
  Rx<String> jobTitle = "".obs;
  Rx<String> role = "".obs;
  Rx<String> homeTown = "".obs;
  Rx<String> address = "".obs;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController homeTownController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Rx<String> dropdownRoleValue = "".obs;
  Rx<String> dropdownIsLockedValue = "".obs;

  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  Rx<int> itemCount = 0.obs;

  RxList<UserDetailsModel> listUsers = <UserDetailsModel>[].obs;
  RxList<UserDetailsModel> listToView = <UserDetailsModel>[].obs;

  Rx<LoginModel?> loginModel = Rx<LoginModel?>(null);
  @override
  Future<void> onInit() async {
    try {
      getEditUser();
      if (loginModel.value != null) {
        username.value = loginModel.value!.username ?? "";
        fullname.value = loginModel.value!.fullName ?? "";
      }
    } catch (e) {
      print("Error during initialization: $e");
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setValueJobTitle(String value) => jobTitle.value = value;
  void setValueDescription(String value) => description.value = value;
  void setValueHomeTown(String value) => homeTown.value = value;
  void setValueAddress(String value) => address.value = value;

  Rx<String> validateErrEmail = "".obs;
  Rx<String> validateErrFullName = "".obs;
  Rx<String> validateErrPhone = "".obs;

  void validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      validateErrEmail.value = "Vui lòng nhập gmail.";
    } else {
      validateErrEmail.value = ""; // Clear error if validation is successful
    }
  }

  void validateFullName(String value) {
    validateErrFullName(value.isEmpty ? "Vui lòng nhập tên" : "");
  }

  void validatePhone(String value) {
    validateErrPhone(value.isEmpty ? "Vui lòng nhập số điện thoại" : "");
  }

  void setValueEmail(String? value) {
    if (value != null) {
      validateEmail(value);
      email(value);
    }
  }

  void setValueFullName(String? value) {
    if (value != null) {
      validateFullName(value);
      fullname(value);
    }
  }

  void setValuePhone(String? value) {
    if (value != null) {
      validatePhone(value);
      phoneNumber(value);
    }
  }

  void showAll() {
    listToView.clear();
    listToView.addAll(listUsers);
  }

  Future<void> getEditUser() async {
    isLoading.value = true;
    try {
      loginModel.value = await EditProfilelApi.getDataUser(accessToken);
      if (loginModel.value != null) {
        username.value = loginModel.value!.username ?? "";
        fullname.value = loginModel.value!.fullName ?? "";
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

  void updateUserData(LoginModel user) {
    // id.value = user.id ?? "";
    fullname.value = user.fullName ?? "";
    avatar.value = user.avatar ?? "";
    email.value = user.email ?? "";
    phoneNumber.value = user.phoneNumber ?? "";
    homeTown.value = user.homeTown ?? "";
    address.value = user.address ?? "";
    jobTitle.value = user.jobTitle ?? "";
    description.value = user.description ?? "";
  }

  Future<void> updateUser(String? userId) async {
    try {
      log(fullNameController.text);
      log(usernameController.text);
      log(emailController.text);
      log(phoneNumberController.text);
      log(jobTitleController.text);
      log(descriptionController.text);
      log(avatar.value);

      validateFullName(fullname.value);
      validatePhone(phoneNumber.value);

      // Check for validation errors
      if (validateErrFullName.value.isNotEmpty ||
          validateErrPhone.value.isNotEmpty) {
        return;
      }
      EditProfile formData = EditProfile(
        fullName: fullNameController.text,
        jobTitle: jobTitleController.text,
        address: addressController.text,
        homeTown: homeTownController.text,
        description: descriptionController.text,
        phoneNumber: phoneNumberController.text,
        avatar: avatar?.isNotEmpty == true ? avatar.value : "",
      );
      // Create an instance of the API request
      var updateUserRequest =
          UpdateUserRequest(model: formData, avatarPath: avatar.value);
      // Call the API to create a new user
      bool check = await updateUserRequest.execute();
      if (check) {
        ViewUtils.showSnackbarMessage("Chỉnh sửa thành công", check);
        getEditUser();
        Get.toNamed(Routes.MAIN_TABVIEW);
      } else {
        ViewUtils.showSnackbarMessage("Chỉnh sửa không thành công", check);
      }
    } catch (e) {
      // Handle exceptions
      Get.snackbar(
        "Thông báo",
        "Lỗi có vấn đề: $e",
        backgroundColor: ColorConstant.white,
      );
    } finally {
      isLoading(false);
    }
  }

  void showData(LoginModel model) {
    refreshForm();
    // Populate form fields with data from the selected user
    fullNameController.text = model.fullName ?? "";
    phoneNumberController.text = model.phoneNumber ?? "";
    emailController.text = model.email ?? "";
    homeTownController.text = model.homeTown ?? "";
    addressController.text = model.address ?? "";
    jobTitleController.text = model.jobTitle ?? "";
    descriptionController.text = model.description ?? "";
    avatar.value = HttpNetWorkUrlApi.baseURL + model.avatar ?? "";
    Get.toNamed(Routes.EDIT_PROFILE, arguments: model.id);
  }

  refreshForm() {
    usernameController.text = "";
    fullNameController.text = '';
    passwordController.text = '';
    emailController.text = "";
    phoneNumberController.text = "";
    jobTitleController.text = "";
    descriptionController.text = "";
    avatar.value = "";
  }

  onImagePick() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (pickedFile != null) {
      final LostDataResponse response2 = await picker.retrieveLostData();
      File file = File(pickedFile.path);
      avatar ??= "".obs;

      // Set the correct path to the picked image
      avatar.value = file.path;

      print("Picked image: ${avatar.value}");
    }
  }

  onTabDeleteAvatar() {
    // Xoá phần tử ở vị trí
    avatar.value = "";
  }
}
