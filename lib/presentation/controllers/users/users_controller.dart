import 'dart:developer';
import 'dart:io';
import 'package:itfsd/presentation/page/users/user.dart';

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
  Rx<int> itemCount = 0.obs;

  RxList<UserDetailsModel> listUsers = <UserDetailsModel>[].obs;
  RxList<UserDetailsModel> listToView = <UserDetailsModel>[].obs;
  Rx<UserDetailsModel?> selectedUser = Rx<UserDetailsModel?>(null);

  ScrollController userScrollController = ScrollController();

  int currentPage = 1;

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

  // Future<void> fetchMoreData() async {
  //   try {
  //     if (noMoreRecord.value || lazyLoading.value) return;
  //     lazyLoading(true);
  //     await Future.delayed(const Duration(seconds: 1));
  //
  //     int nextPage = currentPage + 1;
  //     List<UserDetailsModel> listTmp = await UserApi.getAllDataUsers(nextPage);
  //     if (listTmp.isEmpty) {
  //       noMoreRecord(true);
  //     }
  //     listUsers.addAll(listTmp);
  //     currentPage = nextPage;
  //     // Append data to the paging controller
  //     pagingController?.appendLoadMoreOutput(
  //       LoadMoreOutput(data: listTmp, isLastPage: listTmp.isEmpty),
  //     );
  //   } catch (e) {
  //     log('Error fetching more data: $e');
  //   } finally {
  //     lazyLoading(false);
  //   }
  // }

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

  Future<void> onTypingSearch(String value) async {
    if (value.isNotEmpty) {
      noMoreRecord(true);
      List<UserDetailsModel> searchResults =
          await UserApi.searchlistUserDetails(value);

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
