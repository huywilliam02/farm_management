import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/crops_farm/crops_farm_api.dart';
import 'package:itfsd/presentation/page/crops_farm/more_tree.dart';
import 'package:itfsd/data/model/category/product.dart';
import 'package:itfsd/data/model/crops_farm/cropsfarm.dart';
import 'package:itfsd/data/model/crops_farm/cropsfarmdetail.dart';

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

  RxList<CropsFarmDetail> listCropsFarm = <CropsFarmDetail>[].obs;
  RxList<CropsFarmDetail> listToView = <CropsFarmDetail>[].obs;

  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int indexPage = 1;
  ScrollController cropsscrollController = ScrollController();
  TextEditingController searchController = TextEditingController(text: '');
  final count = 0.obs;
  @override
  Future<void> onInit() async {
    try {
      isLoading(true);
      await refeshData();
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

  refeshData() async {
    try {
      isLoading(true);
      indexPage = 1;
      noMoreRecord(false);
      listCropsFarm.value = await CropsFarmApi.getAllCropsFarm(indexPage);
      showAll();
      isLoading(false);
    } catch (e) {
      log('err$e');
    }
  }

  fetchMoreData() async {
    try {
      if (noMoreRecord.value || lazyLoading.value) {
      } else {
        indexPage += 1;
        lazyLoading(true);
        await Future.delayed(const Duration(seconds: 1));
        List<CropsFarmDetail> listTmp =
            await CropsFarmApi.getAllCropsFarm(indexPage);
        if (listTmp.isEmpty) {
          // Get.snackbar("Thông báo", "Hết dữ liệu");
          noMoreRecord(true);
        } else {
          listCropsFarm.value.addAll(listTmp);
        }
        lazyLoading(false);
      }
    } catch (e) {}
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

  showData(CropsFarmDetail schedule) {
    refeshForm();
    nameController.text = schedule.name;
    diseaseController.text = schedule.disease;
    growthController.text = schedule.growth;
    userController.text = schedule.use;
    harvestController.text = schedule.harvest;
    priceController.text = schedule.price;
    groupCropController.text = schedule.groupCrop.name;
    listImage(schedule.images);
    Get.to(
      () => MoretreeView(
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
      refeshData();
    }
  }

  void increment() => count.value++;
}
