import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/shared/role/role_constants.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/app/util/view_utils.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/model/users/user.dart';
import 'package:itfsd/data/model/users/user_details.dart';
import 'package:itfsd/data/network/api/users/user.dart';
import 'package:itfsd/presentation/controllers/agricultural_products/agricultural_products_constant.dart';
import 'package:itfsd/presentation/page/users/widgets/user_details.dart';

class UsersController extends BaseController {
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
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController homeTownController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  List<String> listIsLockedDropdown = <String>['Kích hoạt', 'Không kích hoạt'];

  List<String> listRoleDropdown = <String>[
    'ADMIN',
    'USER',
    'FARMER',
    'ASSOCIATIONS'
  ];
  Map<String, String> roleLabels = {
    'ADMIN': 'Quản trị',
    'USER': 'Người dùng',
    'FARMER': 'Chủ hội',
    'ASSOCIATIONS': 'Hiệp hội',
  };
  RoleConstants roleConstants = RoleConstants();

  Rx<String> dropdownRoleValue = "".obs;
  Rx<String> dropdownIsLockedValue = "".obs;

  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int indexPage = 1;
  Rx<int> itemCount = 0.obs;

  RxList<UserDetailsModel> listUsers = <UserDetailsModel>[].obs;
  RxList<UserDetailsModel> listToView = <UserDetailsModel>[].obs;
  Rx<UserDetailsModel?> selectedUser = Rx<UserDetailsModel?>(null);

  ScrollController userScrollController = ScrollController();

  @override
  Future<void> onInit() async {
    dropdownRoleValue.value = listRoleDropdown.first;
    dropdownIsLockedValue.value = listIsLockedDropdown.first;
    try {
      isLoading(true);
      await refreshData();
    } catch (e) {
      ViewUtils.handleInitError(e);
    } finally {
      isLoading(false);
    }
    userScrollController = ScrollController()..addListener(scrollListener);
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

  void updateItemCount() => itemCount(listUsers.length);

  void setValueUserName(String value) => username.value = value;
  void setValuePassword(String value) => password.value = value;
  void setValueFullName(String value) => fullname.value = value;
  void setValueEmail(String value) => email.value = value;
  void setValuePhoneNumber(String value) => phoneNumber.value = value;
  void setValueJobTitle(String value) => jobTitle.value = value;
  void setValueDescription(String value) => description.value = value;
  void setValueHomeTown(String value) => homeTown.value = value;
  void setValueAddress(String value) => address.value = value;

  void showAll() {
    listToView.clear();
    listToView.addAll(listUsers);
  }

  void scrollListener() {
    final position = userScrollController.position;
    if (position.haveDimensions && position.maxScrollExtent > 0) {
      final isScrollAtEnd = position.pixels == position.maxScrollExtent;
      if (isScrollAtEnd) {
        fetchMoreData();
      }
    }
  }

  Future<void> refreshData() async {
    try {
      // Show loading indicator
      isLoading(true);
      indexPage = 1;
      noMoreRecord(false);
      listUsers.value = await UserApi.getAllDataUsers(indexPage);
      // Introduce a short delay (optional)
      // await Future.delayed(Duration(milliseconds: 500));
      updateItemCount();
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
      indexPage += 1;
      lazyLoading(true);
      await Future.delayed(const Duration(seconds: 1));

      List<UserDetailsModel> listTmp = await UserApi.getAllDataUsers(indexPage);
      updateItemCount();

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
    log(fullnameController.text);
    log(usernameController.text);
    log(passwordController.text);
    log(emailController.text);
    log(phoneNumberController.text);
    log(jobTitleController.text);
    log("${dropdownRoleValue.value ?? listRoleDropdown.first}");
    log("${dropdownIsLockedValue.value == listIsLockedDropdown.first ? true : false}");
    log(avatar.toString());
    UserModel formData = UserModel(
      fullName: fullnameController.text,
      username: usernameController.text,
      password: passwordController.text,
      jobTitle: jobTitleController.text,
      address: addressController.text,
      homeTown: homeTownController.text,
      description: descriptionController.text,
      email: emailController.text,
      phoneNumber: phoneNumberController.text,
      // avatar: avatar.string,
      avatar: "http://116.118.49.43:8878${avatar.string ?? ''}",
      role: dropdownRoleValue.value ?? listRoleDropdown.first,
      isLocked: dropdownIsLockedValue.value == listIsLockedDropdown.first
          ? true
          : false,
    );
    bool check = userId != null
        ? await UserApi.updateNewUsers(userId, formData, avatar.value)
        : await UserApi.createNewUsers(formData, avatar.value);
    if (check) {
      Get.back();
      ViewUtils.showSnackbarMessage("Tạo nhà thành viên thành công", check);
      // refreshData(); // Corrected function name
    } else {
      ViewUtils.showSnackbarMessage(
          "Tạo nhà thành viên không thành công", check);
    }
  }

  refreshForm() {
    usernameController.text = "";
    fullnameController.text = '';
    passwordController.text = '';
    emailController.text = "";
    phoneNumberController.text = "";
    jobTitleController.text = "";
    descriptionController.text = "";
    avatar.value = "";
  }

  void showUserDetails(UserDetailsModel model) {
    selectedUser.value = model;
    Get.to(() => UserDetailsView(
          idUser: model.id,
        ));
  }
  // void showData(UserDetailsModel userId) {
  //   // Reset the form fields
  //   refreshForm();
  //
  //   // Populate form fields with data from the selected user
  //   usernameController.text = userId.username ?? "";
  //   fullnameController.text = userId.fullName ?? "";
  //   // emailController.text = userId.email ?? "";
  //   // phoneNumberController.text = userId.phoneNumber ?? "";
  //   jobTitleController.text = userId.jobTitle ?? "";
  //   descriptionController.text = userId.description ?? "";
  //   avatar.value = userId.avatar ?? "";
  //   dropdownRoleValue.value = userId.role ?? "";
  //   dropdownIsLockedValue.value =
  //   userId.isLocked ? "Kích hoạt" : "Không kích hoạt";
  //
  //   // Navigate to the user detail page
  //   Get.to(() => UserDetailView());
  // }

  Future<void> onTypingSearch(String value) async {
    if (value.isNotEmpty) {
      noMoreRecord(true);
      listUsers.value = await UserApi.searchlistUserDetails(value);
    } else {
      refreshData();
    }
  }

  // onImagePick() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? pickedFile =
  //       await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
  //   if (pickedFile != null) {
  //     final LostDataResponse response2 = await picker.retrieveLostData();
  //     File file = File(pickedFile.path);
  //     avatar.value = file.path;
  //     print("Picked image: ${avatar.value}");
  //   }
  // }

  onImagePick() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    if (pickedFile != null) {
      final LostDataResponse response2 = await picker.retrieveLostData();
      File file = File(pickedFile.path);
      avatar ??= "".obs;
      avatar.value = file.path;
      print("Picked image: ${avatar.value}");
    }
  }

  onTabDeleteAvatar() {
    // Xoá phần tử ở vị trí
    avatar.value = "";
  }
}
