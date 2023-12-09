import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/model/category/product.dart';
import 'package:itfsd/data/model/crops/crop_model.dart';
import 'package:itfsd/data/model/crops/crops_detail.dart';
import 'package:itfsd/data/network/api/crops_farm/crops_farm_api.dart';
import 'package:itfsd/data/network/api/crops_farm/get_data_all_crops_request.dart';
import 'package:itfsd/presentation/page/crops_farm/edit_crop/create_crop_view.dart';


class CropsFarmController extends BaseController {
  //TODO: Implement CropsFarmController
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
  Rx<String> groupCrop = "".obs;

  RxList<String> listImage = <String>[].obs;

  RxList<CropsDetail> listCropsFarm = <CropsDetail>[].obs;
  RxList<CropsDetail> listToView = <CropsDetail>[].obs;

  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int currentPage = 1;
  ScrollController cropsscrollController = ScrollController();
  TextEditingController searchController = TextEditingController(text: '');
  final count = 0.obs;
  @override
  Future<void> onInit() async {
    try {
      isLoading(true);
      await refreshData();
      await getAllGroupCrop();
      isLoading(false);
    } catch (e) {
      Get.back();
      Get.snackbar("SomeThingWrong", e.toString());
      log(e.toString());
    }
    super.onInit();
    cropsscrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    cropsscrollController.dispose();
    super.onClose();
  }

  getAllGroupCrop() async {
    listgroupCrop.value =
        await CropsFarmApi.getAllDataByTypeCategory("NHOM_CAY_TRONG");
  }

  showAll() {
    listToView.clear();
    listToView.addAll(listCropsFarm);
  }

  void _scrollListener() async {
    if (cropsscrollController.position.pixels ==
        cropsscrollController.position.maxScrollExtent) {
      await fetchMoreData();
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
      isLoading(true);
      currentPage = 1;
      noMoreRecord(false);

      var requestData = GetAllDataCropsRequest(currentPage);

      List<CropsDetail> cropList = await requestData.request();

      listCropsFarm.assignAll(cropList);

      await Future.delayed(const Duration(milliseconds: 500));
      showAll();
    } catch (e) {
      log('Error refreshing data: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchMoreData() async {
    try {
      if (noMoreRecord.value || lazyLoading.value) return;

      currentPage += 1;
      lazyLoading(true);

      await Future.delayed(const Duration(seconds: 1));

      var requestData = GetAllDataCropsRequest(currentPage);

      // Fetch data using the request
      List<CropsDetail> cropList = await requestData.request();

      if (cropList.isEmpty) {
        noMoreRecord(true);
      }
      // Update the state with the fetched data
      listCropsFarm.addAll(cropList);
    } catch (e) {
      log('Error fetching more data: $e');
    } finally {
      lazyLoading(false);
    }
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

  onTabDeleteIamge(int index) {
    listImage.removeAt(index);
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

  chooseGroupCrop(Product product) {
    groupCrop(product.id);
    groupCropController.text = product.name!;
  }

  createCropsfarm(String? idcrops) async {
    log(nameController.text);
    log(diseaseController.text);
    log(growthController.text);
    log(userController.text);
    log(harvestController.text);
    log(price.value.toString());
    log(groupCropController.text);
    log(listImage.toString());
    CropsFarmModel formData = CropsFarmModel(
      name: nameController.text,
      disease: diseaseController.text,
      growth: growthController.text,
      use: userController.text,
      harvest: harvestController.text,
      price: price.value,
      groupCrop: groupCrop.value,
      images: [],
    );
    bool check = await CropsFarmApi.createNewCrops(formData, listImage);
    if (check) {
      Get.back();
      // refeshData();
      Get.snackbar('Thông báo', 'Tạo cây trồng thành công',
          backgroundColor: Colors.green.withOpacity(0.7),
          colorText: Colors.white);
    } else {
      Get.snackbar('Thông báo', 'Tạo cây trồng không thành công',
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    }
  }

  showData(CropsDetail schedule) {
    refeshForm();
    nameController.text = schedule.name!;
    diseaseController.text = schedule.disease!;
    growthController.text = schedule.growth!;
    userController.text = schedule.use!;
    harvestController.text = schedule.harvest!;
    priceController.text = schedule.price!;
    groupCropController.text = schedule.groupCrop!.name;
    listImage(schedule.images);
    Get.to(
      () => CreateCropView(
        idtree: schedule.id,
      ),
    );
  }

  refeshForm() {
    nameController.text = "";
    diseaseController.text = '';
    growthController.text = '';
    userController.text = "";
    harvestController.text = "";
    price(0);
    priceController.text = "";
    groupCrop("");
    groupCropController.text = "";
    listImage([]);
  }

  deleteData(String idTree) async {
    try {
      bool check = await CropsFarmApi.deleteTree(idTree);
      if (check) {
        //thông báo true
      } else {
        //thông báo fail
      }
    } catch (e) {
      Get.back();
      Get.snackbar("title", "Có gì đó không đúng");
    }
  }

  onTypingSearchCropsFarm(String value) async {
    if (value.isNotEmpty) {
//search
      noMoreRecord(true);
      listCropsFarm.value = await CropsFarmApi.searchlistCropsFarm(value);
    } else {
      refreshData();
    }
  }

  void increment() => count.value++;
}
