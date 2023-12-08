import 'dart:developer';
import 'dart:io';
import 'package:itfsd/app/core/shared/role/role_user_constants.dart';
import 'package:itfsd/app/routes/app_pages.dart';
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

  ScrollController userScrollController = ScrollController();

  int currentPage = 1;
  bool isFetching = false;
  DateTime? lastFetchTime;

  CommonPagingController<UserDetailsModel>? pagingController;

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
    userScrollController = ScrollController()..addListener(scrollListener);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pagingController?.dispose();
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

  void scrollListener() {
    final position = userScrollController.position;
    if (position.haveDimensions && position.maxScrollExtent > 0) {
      final isScrollAtEnd = position.pixels == position.maxScrollExtent;
      if (isScrollAtEnd) {
        fetchMoreData();
      }
    }
  }

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
  //
  // Future<void> createUser(String? userId, {String? avatarPath}) async {
  //   log(fullNameController.text);
  //   log(usernameController.text);
  //   log(passwordController.text);
  //   log(emailController.text);
  //   log(phoneNumberController.text);
  //   log(jobTitleController.text);
  //   log("${dropdownRoleValue.value ?? listRoleDropdown.first}");
  //   log("${dropdownIsLockedValue.value == listIsLockedDropdown.first ? true : false}");
  //   log(avatar.toString());
  //   String avatarPath = avatar.string ?? '';
  //   UserModel formData = UserModel(
  //     fullName: fullNameController.text,
  //     username: usernameController.text,
  //     password: passwordController.text,
  //     jobTitle: jobTitleController.text,
  //     address: addressController.text,
  //     homeTown: homeTownController.text,
  //     description: descriptionController.text,
  //     email: emailController.text,
  //     phoneNumber: phoneNumberController.text,
  //     // avatar: avatar.string,
  //     avatar: avatarPath ?? "",
  //     role: dropdownRoleValue.value ?? listRoleDropdown.first,
  //     isLocked: dropdownIsLockedValue.value == listIsLockedDropdown.first
  //         ? true
  //         : false,
  //   );
  //   bool check = userId != null
  //       ? await UserApi.updateNewUsers(userId, formData, avatar.value)
  //       : await UserApi.createNewUser(formData, avatar.value);
  //   if (check) {
  //     Get.back();
  //     ViewUtils.showSnackbarMessage("Tạo thành viên thành công", check);
  //     refreshData(); // Corrected function name
  //   } else {
  //     ViewUtils.showSnackbarMessage("Tạo thành viên không thành công", check);
  //   }
  // }

  Future<void> updateUser(String? userId) async {
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
      // avatar: avatar.isNotEmpty ? avatar.value : "",
      isLocked: dropdownIsLockedValue.value == listIsLockedDropdown.first
          ? true
          : false,
    );
    bool check = await UserApi.updateNewUser(userId, formData);

    if (check) {
      Get.back();
      ViewUtils.showSnackbarMessage("Chỉnh sửa thành công", check);
      refreshData(); // Corrected function name
    } else {
      ViewUtils.showSnackbarMessage("Chỉnh sửa không thành công", check);
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
    print('showData is called with userId: $userDetails');
    // Rest of the code...

    print('usernameController: ${usernameController.text}');
    print('fullnameController: ${fullNameController.text}');
    print('avatar: ${avatar.value}');
    // Reset the form fields
    refreshForm();
    // Populate form fields with data from the selected user
    usernameController.text = userDetails.username ?? "";
    fullNameController.text = userDetails.fullName ?? "";
    emailController.text = userDetails.email ?? "";
    phoneNumberController.text = userDetails.phoneNumber ?? "";
    jobTitleController.text = userDetails.jobTitle ?? "";
    descriptionController.text = userDetails.description ?? "";
    avatar.value = HttpNetWorkUrlApi.baseURL + userDetails.avatar ?? "";
    dropdownRoleValue.value = userDetails.role ?? "";
    dropdownIsLockedValue.value =
        userDetails.isLocked ? "Kích hoạt" : "Không kích hoạt";
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
}
