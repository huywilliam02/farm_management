import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/util/view_utils.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/model/crops/crops_detail.dart';
import 'package:itfsd/data/network/api/crops_farm/get_data_all_crops_request.dart';
import 'package:itfsd/data/network/api/users/delete_user_request.dart';
import 'package:itfsd/presentation/page/crops_farm/edit_crop/edit_crop_view.dart';
import 'package:itfsd/presentation/page/crops_farm/widgets/crop_details.dart';

import '../../agricultural_products/agricultural_products_constant.dart';

class EditCropController extends BaseController {
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

  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  Rx<int> itemCount = 0.obs;

  RxList<CropsDetail> listCrop = <CropsDetail>[].obs;
  RxList<CropsDetail> listToView = <CropsDetail>[].obs;
  Rx<CropsDetail?> selectedCrop = Rx<CropsDetail?>(null);

  int currentPage = 1;
  // bool isFetching = false;
  // DateTime? lastFetchTime;

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
    listToView.addAll(listCrop);
  }

  Future<void> refreshData() async {
    try {
      // Show loading indicator
      isLoading(true);
      currentPage = 1;
      noMoreRecord(false);
      // listUsers.value = await UserApi.getAllDataUsers(currentPage);

      var requestData = GetAllDataCropsRequest(currentPage);

      // Fetch data using the request
      var cropList = await requestData.request();

      // Update the state with the fetched data
      listCrop.assignAll(cropList);
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

      var requestData = GetAllDataCropsRequest(currentPage);

      // Fetch data using the request
      List<CropsDetail> cropList = await requestData.request();
      if (cropList.isEmpty) {
        noMoreRecord(true);
      }

      listCrop.addAll(cropList);
    } catch (e) {
      log('Error fetching more data: $e');
    } finally {
      lazyLoading(false);
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

  void showCropDetails(CropsDetail model) {
    selectedCrop.value = model;
    Get.to(() => CropDetailsView(
          cropId: model.id,
        ));
  }

  void showData(CropsDetail model) {
    print('showData is called with userId: $model');
    // Rest of the code...

    print('usernameController: ${usernameController.text}');
    print('fullnameController: ${fullNameController.text}');
    print('avatar: ${avatar.value}');
    // Reset the form fields
    refreshForm();
    // Populate form fields with data from the selected user

    Get.to(
      () => EditCropView(
        cropId: model.id,
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
