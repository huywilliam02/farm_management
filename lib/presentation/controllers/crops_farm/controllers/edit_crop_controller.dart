import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/util/view_utils.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/model/category/product.dart';
import 'package:itfsd/data/model/crops/crop_model.dart';
import 'package:itfsd/data/model/crops/crops_detail.dart';
import 'package:itfsd/data/network/api/crops_farm/crops_farm_api.dart';
import 'package:itfsd/data/network/api/crops_farm/delete_crop_request.dart';
import 'package:itfsd/data/network/api/crops_farm/get_data_all_crops_request.dart';
import 'package:itfsd/data/network/api/crops_farm/update_crop_request.dart';
import 'package:itfsd/data/network/api/users/delete_user_request.dart';
import 'package:itfsd/presentation/page/crops_farm/crops_farm_view.dart';
import 'package:itfsd/presentation/page/crops_farm/edit_crop/edit_crop_view.dart';
import 'package:itfsd/presentation/page/crops_farm/widgets/crop_details.dart';

import '../../agricultural_products/agricultural_products_constant.dart';

class EditCropController extends BaseController {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController diseaseController = TextEditingController(text: '');
  TextEditingController growthController = TextEditingController(text: '');
  TextEditingController userController = TextEditingController(text: '');
  TextEditingController harvestController = TextEditingController(text: '');
  TextEditingController groupCropController =
      TextEditingController(text: 'Chọn nhóm cây trồng');
  TextEditingController priceController = TextEditingController(text: '');

  RxList<Product> listgroupCrop = <Product>[].obs;

  Rx<String> name = "".obs;
  Rx<String> disease = "".obs;
  Rx<String> growth = "".obs;
  Rx<String> user = "".obs;
  Rx<String> harvest = "".obs;
  Rx<int> price = 0.obs;
  Rx<String> price2 = "".obs;
  Rx<String> groupCrop = "".obs;

  RxList<String> listImage = <String>[].obs;

  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int currentPage = 1;

  Rx<int> itemCount = 0.obs;

  RxList<CropsDetail> listCrop = <CropsDetail>[].obs;
  RxList<CropsDetail> listToView = <CropsDetail>[].obs;
  Rx<CropsDetail?> selectedCrop = Rx<CropsDetail?>(null);

  @override
  Future<void> onInit() async {
    try {
      isLoading(true);
      refreshData();
      getAllGroupCrop();
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

  void showAll() {
    listToView.clear();
    listToView.addAll(listCrop);
  }

  setValueName(String value) {
    print("hehe");
    name.value = value;
  }

  setValueDisease(String value) {
    print("hehe");
    disease.value = value;
  }

  setValueGrowth(String value) {
    print("hehe");
    growth.value = value;
  }

  setValueUser(String value) {
    print("hehe");
    user.value = value;
  }

  setValueHarvest(String value) {
    print("hehe");
    harvest.value = value;
  }

  chooseGroupCrop(Product product) {
    groupCrop(product.id);
    groupCropController.text = product.name!;
  }

  getAllGroupCrop() async {
    listgroupCrop.value =
        await CropsFarmApi.getAllDataByTypeCategory("NHOM_CAY_TRONG");
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

  Future<void> updateCrop(String? cropId) async {
    try {
      log(nameController.text);
      log(diseaseController.text);
      log(growthController.text);
      log(userController.text);
      log(harvestController.text);
      log(price.value.toString());
      log(groupCrop.value);
      CropsFarmModel formData = CropsFarmModel(
        name: nameController.text,
        disease: diseaseController.text,
        growth: growthController.text,
        use: userController.text,
        harvest: harvestController.text,
        price: price.value,
        groupCrop: groupCrop.value,
      );
      // Create an instance of the API request
      // var updateCropRequest = UpdateCropRequest(
      //   cropId: cropId,
      //   formEdit: formData,
      // );
      // // Call the API to create a new user
      // bool check = await updateCropRequest.execute();
      bool check = await CropsFarmApi.updateCrop(formData, cropId);
      if (check) {
        Get.to(() => const CropsFarmView());
        refreshData();
        ViewUtils.showSnackbarMessage("Chỉnh sửa thành công", check);
      } else {
        ViewUtils.showSnackbarMessage("Chỉnh sửa không thành công", check);
      }
    } catch (e) {
      // Handle exceptions
      print('Error updating crop: $e');
      ViewUtils.showSnackbarMessage("Lỗi khi cập nhật cây trồng", false);
    }
  }

  void showCropDetails(CropsDetail model) {
    selectedCrop.value = model;
    Get.to(() => CropDetailsView(
          cropId: model.id,
        ));
  }

  showData(CropsDetail model) {
    // refeshForm();
    nameController.text = model.name!;
    diseaseController.text = model.disease!;
    growthController.text = model.growth!;
    userController.text = model.use!;
    harvestController.text = model.harvest!;
    priceController.text = model.price;
    groupCropController.text = model.groupCrop!.name;
    listImage(model.images);

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
      listImage.add(file.path);
    }
  }

  onTabDeleteImage(int index) {
    listImage.removeAt(index);
  }

  Future<void> deleteCrop(String cropId) async {
    print(cropId);
    try {
      // Create an instance of the API request
      var deleteCropRequest = DeleteCropRequest(cropId: cropId);
      // Call the API to delete the user directly
      bool check = await deleteCropRequest.execute();

      if (check) {
        ViewUtils.showSnackbarMessage("Xóa cây trồng thành công", check);
        refreshData();
        Get.toNamed(Routes.CROPS_FARM);
      }
    } catch (e) {
      ViewUtils.handleError();
    } finally {
      refreshData();
    }
  }
}
