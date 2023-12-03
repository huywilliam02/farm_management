import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/util/view_utils.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/model/users/user.dart';
import 'package:itfsd/presentation/controllers/agricultural_products/agricultural_products_constant.dart';

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

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  List<String> listIsLockedDropdown = <String>['Kích hoạt', 'Không kích hoạt'];
  List<String> listRoleDropdown = <String>['Admin', 'User'];

  Rx<String> dropdownRoleValue = "".obs;
  Rx<String> dropdownIsLockedValue = "".obs;

  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int indexPage = 1;
  Rx<int> itemCount = 0.obs;

  @override
  Future<void> onInit() async {
    dropdownRoleValue.value = listRoleDropdown.first;
    dropdownIsLockedValue.value = listIsLockedDropdown.first;
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

  void setValueUserName(String value) => username.value = value;
  void setValuePassword(String value) => password.value = value;
  void setValueFullName(String value) => fullname.value = value;
  void setValueEmail(String value) => email.value = value;
  void setValuePhoneNumber(String value) => phoneNumber.value = value;
  void setValueJobTitle(String value) => jobTitle.value = value;
  void setValueDescription(String value) => description.value = value;

  Future<void> createUser(String? id) async {
    UserModel(
      fullName: fullnameController.text,
      jobTitle: jobTitleController.text,
      description: descriptionController.text,
      avatar: avatar.string,
      username: usernameController.text,
      role: roleController.text,
      isLocked: dropdownIsLockedValue.value == listIsLockedDropdown.first
          ? true
          : false,
    );
    // bool check = id != null
    //     ? await SupplierApi.updateSupplier(idsupplier, formData)
    //     : await SupplierApi.createSupplier(formData);
    // if (check) {
    //   Get.back();
    //   ViewUtils.showSnackbarMessage("Tạo nhà cung cấp thành công", check);
    //   // refreshData(); // Corrected function name
    // } else {
    //   ViewUtils.showSnackbarMessage("Tạo nhà cung cấp không thành công", check);
    // }
  }

  onImagePick() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      final LostDataResponse response2 = await picker.retrieveLostData();
      File file = File(pickedFile.path);
      avatar.value = file.path;
      print("Picked image: ${avatar.value}");
    }
  }

  onTabDeleteAvatar() {
    // Xoá phần tử ở vị trí
    avatar.value = "";
  }
}
