import 'dart:developer';
import 'dart:io';
import 'package:itfsd/app/core/shared/role/role_user_constants.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/data/network/api/users/delete_user_request.dart';
import 'package:itfsd/data/network/api/users/get_all_data_users_request.dart';
import 'package:itfsd/data/network/api/users/update_user_admin_request.dart';
import 'package:itfsd/presentation/page/users/edit_user/edit_user_view.dart';
import 'package:itfsd/presentation/page/users/user.dart';

class EditUserController extends BaseController {
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

  List<String> listIsLockedDropdown = RoleUserConstants.listIsLockedDropdown;

  List<String> listRoleDropdown = RoleUserConstants.listRoleDropdown;
  Map<String, String> roleLabels = RoleUserConstants.roleLabels;
  RoleConstants roleConstants = RoleConstants();

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
  // bool isFetching = false;
  // DateTime? lastFetchTime;

  @override
  Future<void> onInit() async {
    dropdownRoleValue.value = listRoleDropdown.first;
    dropdownIsLockedValue.value = listIsLockedDropdown.first;
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

  Future<void> refreshData() async {
    try {
      // Show loading indicator
      isLoading(true);
      currentPage = 1;
      noMoreRecord(false);
      // listUsers.value = await UserApi.getAllDataUsers(currentPage);

      var requestData = GetAllDataUsersRequest(currentPage);

      // Fetch data using the request
      var userList = await requestData.request();

      // Update the state with the fetched data
      listUsers.assignAll(userList);
      // Introduce a short delay (optional)

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
      lazyLoading(true);
      currentPage += 1;

      await Future.delayed(const Duration(seconds: 1));

      // List<UserDetailsModel> listTmp =
      //     await UserApi.getAllDataUsers(currentPage);

      var requestData = GetAllDataUsersRequest(currentPage);

      // Fetch data using the request
      List<UserDetailsModel> userList = await requestData.request();
      if (userList.isEmpty) {
        noMoreRecord(true);
      }

      listUsers.addAll(userList);
    } catch (e) {
      log('Error fetching more data: $e');
    } finally {
      lazyLoading(false);
    }
  }

  Future<void> updateUserAdmin(String? userId) async {
    try {
      log(fullNameController.text);
      log(usernameController.text);
      log(emailController.text);
      log(phoneNumberController.text);
      log(jobTitleController.text);
      log("${dropdownRoleValue.value ?? listRoleDropdown.first}");
      log("${dropdownIsLockedValue.value == listIsLockedDropdown.first ? true : false}");
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
        role: dropdownRoleValue.value ?? listRoleDropdown.first,
        isLocked: dropdownIsLockedValue.value == listIsLockedDropdown.first
            ? false
            : true,
      );

      // Create an instance of the API request
      var updateUserAdminRequest =
          UpdateUserAdminRequest(idUser: userId, formEdit: formData);

      // Call the API to update the user directly
      bool check = await updateUserAdminRequest.execute();

      if (check) {
        Get.back();
        refreshData();
        ViewUtils.showSnackbarMessage("Chỉnh sửa thành công", check);
      } else {
        ViewUtils.showSnackbarMessage("Chỉnh sửa không thành công", check);
      }
    } catch (e) {
      // Handle exceptions
      print('Error updating user: $e');
      ViewUtils.showSnackbarMessage("Lỗi khi cập nhật người dùng", false);
    }
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

  void showUserDetails(UserDetailsModel model) {
    selectedUser.value = model;
    Get.to(() => UserDetailsView(
          idUser: model.id,
        ));
  }

  void showData(UserDetailsModel userDetails) {
    usernameController.text = userDetails.username ?? "";
    fullNameController.text = userDetails.fullName ?? "";
    emailController.text = userDetails.email ?? "";
    phoneNumberController.text = userDetails.phoneNumber ?? "";
    jobTitleController.text = userDetails.jobTitle ?? "";
    descriptionController.text = userDetails.description ?? "";
    avatar.value = HttpNetWorkUrlApi.baseURL + userDetails.avatar ?? "";
    dropdownRoleValue.value = userDetails.role ?? "";
    dropdownIsLockedValue.value =
        userDetails.isLocked ? "Không kích hoạt" : "Kích hoạt";
    Get.to(
      () => EditUserView(
        userId: userDetails.id,
      ),
    );
  }

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

  Future<void> deleteData(String userid) async {
    print(userid);
    try {
      // Create an instance of the API request
      var deleteUserRequest = DeleteUserRequest(idUsers: userid);
      // Call the API to delete the user directly
      bool check = await deleteUserRequest.execute();

      if (check) {
        ViewUtils.showSnackbarMessage("Xóa người dùng thành công", check);
        refreshData();
        Get.toNamed(Routes.USERS);
      }
    } catch (e) {
      ViewUtils.handleError();
    } finally {
      refreshData();
    }
  }
}
