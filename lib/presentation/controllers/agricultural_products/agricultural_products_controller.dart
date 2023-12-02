import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'agricultural_products_constant.dart';

class AgriculturalProductsController extends BaseController {
  //TODO: Implement AgriculturalProductsController
  Rx<String> nameAgriculturalProduct = "".obs;
  Rx<int> moneyAgriculturalProduct = 0.obs;
  Rx<String> quantityAgriculturalProduct = "".obs;
  Rx<String> weightAgriculturalProduct = "".obs;
  Rx<String> informationAgriculturalProduct = "".obs;
  RxList<String> listImage = <String>[].obs;
  RxList<AgriculturalProductDetails> listAgriculturalProduct =
      <AgriculturalProductDetails>[].obs;
  RxList<AgriculturalProductDetails> listToView =
      <AgriculturalProductDetails>[].obs;
  TextEditingController nameAgriculturalProductController =
      TextEditingController(text: '');
  TextEditingController moneyAgriculturalProductController =
      TextEditingController(text: '');
  TextEditingController quantityAgriculturalProductController =
      TextEditingController(text: '');
  TextEditingController weightAgriculturalProductController =
      TextEditingController(text: '');
  TextEditingController informationAgriculturalProductController =
      TextEditingController(text: '');
  TextEditingController farmcontroller =
      TextEditingController(text: 'Mời chọn doanh nghiệp');
  TextEditingController timetAgriculturalProductController =
      TextEditingController();
  TextEditingController searchController = TextEditingController(text: '');
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  Rx<DateTime> dateStartChoose = DateTime.now().obs;
  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int indexPage = 1;
  ScrollController agriculturalProductscrollController = ScrollController();
  List<String> listStatusDropdown = <String>['Hàng tồn kho', 'Hàng xuất kho'];
  Rx<String> dropdownValue = "".obs;
  RxList<Farm> listFarm = <Farm>[].obs;
  Rx<String> idFarmChoose = ''.obs;
  final count = 0.obs;
  @override
  Future<void> onInit() async {
    dropdownValue.value = listStatusDropdown.first;
    try {
      isLoading(true);
      await getAllFarm();
      await refeshDataAgriculturalProduct();
      isLoading(false);
    } catch (e) {
      Get.back();
      Get.snackbar("Bị lỗi ", e.toString());
      log(e.toString());
    }
    super.onInit();

    agriculturalProductscrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (agriculturalProductscrollController.position.pixels ==
        agriculturalProductscrollController.position.maxScrollExtent) {
      await fetchMoreDataAgriculturalProduct();
    }
  }

  getAllFarm() async {
    listFarm.value = await AgriculturalProductApi.getAllFarm();
  }

  changeFarm(Farm farm) {
    idFarmChoose(farm.id);
    farmcontroller.text = farm.name;
  }

  setValueNameAgriculturalProduct(String value) {
    print("hehe");
    nameAgriculturalProduct.value = value;
  }

  setValueQuantityAgriculturalProduct(String value) {
    print("hehe");
    quantityAgriculturalProduct.value = value;
  }

  setValueWeightAgriculturalProduct(String value) {
    print("hehe");
    weightAgriculturalProduct.value = value;
  }

  setValueInformationAgriculturalProduct(String value) {
    print("hehe");
    informationAgriculturalProduct.value = value;
  }

  showAll() {
    listToView.clear();
    listToView.addAll(listAgriculturalProduct);
  }

  refeshDataAgriculturalProduct() async {
    try {
      isLoading(true);
      indexPage = 1;
      noMoreRecord(false);
      listAgriculturalProduct.value =
          await AgriculturalProductApi.getAllAgricultalProduct(indexPage);
      showAll();
      isLoading(false);
    } catch (e) {
      log('err$e');
    }
  }

  refeshFormAgriculturalProduct() {
    nameAgriculturalProductController.text = "";
    moneyAgriculturalProduct(0);
    quantityAgriculturalProductController.text = "";
    weightAgriculturalProductController.text = "";
    timetAgriculturalProductController.text = "";
    listImage([]);
  }

  fetchMoreDataAgriculturalProduct() async {
    try {
      if (noMoreRecord.value || lazyLoading.value) {
      } else {
        indexPage += 1;
        lazyLoading(true);
        await Future.delayed(const Duration(seconds: 1));
        List<AgriculturalProductDetails> listTmp =
            await AgriculturalProductApi.getAllAgricultalProduct(indexPage);
        if (listTmp.isEmpty) {
          // Get.snackbar("Thông báo", "Hết dữ liệu");
          noMoreRecord(true);
        } else {
          listAgriculturalProduct.value.addAll(listTmp);
        }
      }
    } finally {
      lazyLoading(false);
    }
  }

  onTypingSearchAgriculturalProduct(String value) async {
    if (value.isNotEmpty) {
//search
      noMoreRecord(true);
      listAgriculturalProduct.value =
          await AgriculturalProductApi.searchlistAgriculturalProduct(value);
    } else {
      refeshDataAgriculturalProduct();
    }
  }

  chooseDate(bool isStart) async {
    DateTime dateTime = isStart
        ? dateStartChoose.value
        : dateStartChoose.value.add(const Duration(days: 0));
    await Get.dialog(
        barrierDismissible: true,
        Scaffold(
          backgroundColor: Colors.black.withOpacity(0.4),
          body: SafeArea(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: UtilsReponsive.height(Get.context!, 300),
                width: UtilsReponsive.width(Get.context!, 300),
                child: CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    currentDate: DateTime.now(),
                    firstDate: dateTime,
                    calendarType: CalendarDatePicker2Type.single,
                    centerAlignModePicker: true,
                    selectedDayTextStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                    selectedDayHighlightColor: ColorConstant.primary,
                  ),
                  onValueChanged: (dates) {
                    if (isStart) {
                      dateStartChoose(dates[0]);
                      timetAgriculturalProductController.text =
                          dateFormat.format(dates[0]!);
                    }
                    Get.back();
                  },
                  value: [dateStartChoose.value],
                ),
              ),
            ),
          ),
        ));
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

  showDataAgriculturalProduct(AgriculturalProductDetails model) {
    refeshDataAgriculturalProduct();
    nameAgriculturalProductController.text = model.name;
    moneyAgriculturalProduct(model.money);
    quantityAgriculturalProductController.text = model.quantity;
    weightAgriculturalProductController.text = model.weight;
    timetAgriculturalProductController.text = model.time;
    idFarmChoose("");
    listImage(model.images);
    Get.to(() => CreateAgriculralProductView(
          idAgriculralProduct: model.id,
        ));
  }

  onTabDeleteIamge(int index) {
    listImage.removeAt(index);
  }

  deleteDataRequestFormAgriculturalProduct(String idAgriculturalProduct) async {
    try {
      bool check = await AgriculturalProductApi.deleteAgriculturalProduct(
          idAgriculturalProduct);
      if (check) {
        //thông báo true
        refeshDataAgriculturalProduct();
        Get.to(() => const AgriculturalProductsView());
        Get.snackbar('Thông báo', 'Xóa thu hoạch thành công',
            backgroundColor: Colors.green.withOpacity(0.7),
            colorText: Colors.white);
      } else {
        Get.snackbar('Thông báo', 'Xóa thu hoạch không thành công',
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    } catch (e) {
      Get.back();
      Get.snackbar("Lỗi", "Có gì đó không đúng");
    }
  }

  void increment() => count.value++;
}
