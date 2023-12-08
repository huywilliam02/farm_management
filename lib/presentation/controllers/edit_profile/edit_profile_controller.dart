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
import 'package:itfsd/presentation/page/account/account.dart';
import 'package:itfsd/presentation/page/login/login.dart';
import 'package:itfsd/presentation/page/users/edit_user/edit_user_view.dart';
import 'package:itfsd/presentation/page/users/user.dart';

class EditProfileController extends BaseController {
  //TODO: Implement UsersController
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
  Rx<UserDetailsModel?> selectedUser = Rx<UserDetailsModel?>(null);

  int currentPage = 1;

  @override
  Future<void> onInit() async {
    try {
      isLoading(true);

      refreshData();
    } catch (e) {
      ViewUtils.handleInitError(e);
    } finally {
      isLoading(false);
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

  void setValueEmail(String value) => email.value = value;
  void setValueJobTitle(String value) => jobTitle.value = value;
  void setValueDescription(String value) => description.value = value;
  void setValueHomeTown(String value) => homeTown.value = value;
  void setValueAddress(String value) => address.value = value;

  Rx<String> validateErrUserName = "".obs;
  Rx<String> validateErrFullName = "".obs;
  Rx<String> validateErrPassword = "".obs;
  Rx<String> validateErrPhone = "".obs;

  // void validateUserName(String value) {
  //   validateErrUserName(value.isEmpty ? "Vui lòng nhập tài khoản" : "");
  // }

  void validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      validateErrUserName.value = "Vui lòng nhập tài khoản.";
    } else {
      validateErrUserName.value = ""; // Clear error if validation is successful
    }
  }

  void validateFullName(String value) {
    validateErrFullName(value.isEmpty ? "Vui lòng nhập tên" : "");
  }

  void validatePassword(String value) {
    validateErrPassword(value.isEmpty ? "Mật khẩu phải có 8 ký tự" : "");
  }

  void validatePhone(String value) {
    validateErrPhone(value.isEmpty ? "Vui lòng nhập số điện thoại" : "");
  }

  void setValueUserName(String? value) {
    if (value != null) {
      validateUserName(value);
      username(value);
    }
  }

  void setValueFullName(String? value) {
    if (value != null) {
      validateFullName(value);
      fullname(value);
    }
  }

  void setValuePassword(String? value) {
    if (value != null) {
      validatePassword(value);
      password(value);
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

  bool isFetching = false;
  DateTime? lastFetchTime;

  Future<void> fetchMoreDataThrottled() async {
    if (isFetching) return;

    final currentTime = DateTime.now();
    if (lastFetchTime != null &&
        currentTime.difference(lastFetchTime!) < const Duration(seconds: 2)) {
      return; // Throttle requests to every 2 seconds
    }
    try {
      isFetching = true;
      await fetchMoreData();
    } finally {
      isFetching = false;
      lastFetchTime = DateTime.now();
    }
  }

  Future<void> refreshData() async {
    try {
      // Show loading indicator
      isLoading(true);
      currentPage = 1;
      noMoreRecord(false);
      listUsers.value = await UserApi.getAllDataUsers(currentPage);
      // Introduce a short delay (optional)
      email.value = Get.find<LoginController>().loginModel.value!.phoneNumber;
      await Future.delayed(const Duration(milliseconds: 500));
      showAll();
    } catch (e) {
      // Handle errors, e.g., show an error message
      log('Error refreshing data: $e');
      // Optionally: Show an error message to the user
    } finally {
      // Hide loading indicator whether successful or not
      isLoading(false);
    }
  }

  Future<void> fetchMoreData() async {
    try {
      if (noMoreRecord.value || lazyLoading.value) return;

      currentPage += 1;
      lazyLoading(true);

      await Future.delayed(const Duration(seconds: 1));

      List<UserDetailsModel> listTmp =
          await UserApi.getAllDataUsers(currentPage);

      if (listTmp.isEmpty) {
        noMoreRecord(true);
      }

      listUsers.addAll(listTmp);
    } catch (e) {
      log('Error fetching more data: $e');
    } finally {
      lazyLoading(false);
    }
  }

  Future<void> createUser(String? userId) async {
    log(fullNameController.text);
    log(usernameController.text);
    log(passwordController.text);
    log(emailController.text);
    log(phoneNumberController.text);
    log(jobTitleController.text);

    log(avatar.toString());
    try {
      // Validate user input
      validateUserName(username.value);
      validateFullName(fullname.value);
      validatePassword(password.value);
      validatePhone(phoneNumber.value);

      // Check for validation errors
      if (validateErrUserName.value.isNotEmpty ||
          validateErrPassword.value.isNotEmpty ||
          validateErrPhone.value.isNotEmpty ||
          validateErrFullName.value.isNotEmpty) {
        return;
      }

      // Create UserModel object
      UserModel formData = UserModel(
        fullName: fullNameController.text,
        username: usernameController.text,
        password: passwordController.text,
        jobTitle: jobTitleController.text,
        address: addressController.text,
        homeTown: homeTownController.text,
        description: descriptionController.text,
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
        role: dropdownRoleValue.value,
        avatar: avatar.isNotEmpty ? avatar.value : "",
      );

      // Call the API to create a new user
      bool check = await UserApi.createNewUser(formData, avatar.value);

      if (check) {
        Get.back();
        ViewUtils.showSnackbarMessage("Tạo thành viên thành công", check);
        refreshData();
      } else {
        ViewUtils.showSnackbarMessage("Tạo thành viên không thành công", check);
      }
    } catch (e) {
      // Handle exceptions
      Get.snackbar(
        "Thông báo",
        "Lỗi có vấn đề",
        backgroundColor: ColorConstant.white,
      );
    } finally {
      isLoading(false);
    }
  }

  // Future<void> createUser(String? userId) async {
  //   log(fullNameController.text);
  //   log(usernameController.text);
  //   log(passwordController.text);
  //   log(emailController.text);
  //   log(phoneNumberController.text);
  //   log(jobTitleController.text);
  //   log("${dropdownRoleValue.value ?? listRoleDropdown.first}");
  //   // log("${dropdownIsLockedValue.value == listIsLockedDropdown.first ? true : false}");
  //   log(avatar.toString());
  //   isLoading(true);
  //   try {
  //     validateUserName(username.value);
  //     validateFullName(fullname.value);
  //     validatePassword(password.value);
  //     validatePhone(phoneNumber.value);
  //     if (validateErrUserName.value.isEmpty &&
  //         validateErrPassword.value.isEmpty &&
  //         validateErrPhone.value.isEmpty &&
  //         validateErrFullName.value.isEmpty) {
  //       UserModel formData = UserModel(
  //         fullName: fullNameController.text,
  //         username: usernameController.text,
  //         password: passwordController.text,
  //         jobTitle: jobTitleController.text,
  //         address: addressController.text,
  //         homeTown: homeTownController.text,
  //         description: descriptionController.text,
  //         email: emailController.text,
  //         phoneNumber: phoneNumberController.text,
  //         role: dropdownRoleValue.value ?? listRoleDropdown.first,
  //         // isLocked: dropdownIsLockedValue.value == listIsLockedDropdown.first
  //         //     ? true
  //         //     : false,
  //         avatar: avatar.isNotEmpty ? avatar.value : "",
  //       );
  //       bool check = await UserApi.createNewUser(formData, avatar.value);
  //
  //       if (check) {
  //         Get.back();
  //         ViewUtils.showSnackbarMessage("Tạo thành viên thành công", check);
  //         refreshData(); // Corrected function name
  //       } else {}
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       "Thông báo",
  //       "Tạo thành viên không thành công",
  //       backgroundColor: ColorConstant.white,
  //     );
  //   } finally {
  //     isLoading(false);
  //   }
  // }

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

  Future<void> onTypingSearch(String value) async {
    if (value.isNotEmpty) {
      noMoreRecord(true);
      List<UserDetailsModel> searchResults =
          await UserApi.searchListUserDetails(value);

      if (searchResults.isEmpty) {
        // Clear existing data when there are no search results
        listUsers.clear();
      } else {
        // Update the list with search results
        listUsers.assignAll(searchResults);
      }
    } else {
      // Clear existing data when the search query is empty
      refreshData();
    }
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
