import 'dart:developer';
import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/ingredients/ingredients_api.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:itfsd/data/model/igredients/ingredientsDetail.dart';
import 'package:itfsd/data/model/igredients/ingredientsModel.dart';
import 'package:itfsd/presentation/page/ingredients/create_ingredients_view.dart';
import 'package:itfsd/presentation/page/ingredients/ingredients.details.dart';
import 'package:itfsd/presentation/page/ingredients/ingredients_view.dart';

class IngredientsController extends BaseController {
  //TODO: Implement IngredientsControlle
  Rx<String> nameingredients = "".obs;
  Rx<int> moneyingredients = 0.obs;
  Rx<String> quantityingredients = "".obs;
  Rx<String> weightingredients = "".obs;
  Rx<String> informationingredients = "".obs;
  RxList<String> listImage = <String>[].obs;
  RxList<IngredientsDetail> listIngredients = <IngredientsDetail>[].obs;
  RxList<IngredientsDetail> listToView = <IngredientsDetail>[].obs;
  TextEditingController nameingredientsController =
      TextEditingController(text: '');
  TextEditingController moneyingredientsController =
      TextEditingController(text: '');
  TextEditingController quantityingredientsController =
      TextEditingController(text: '');
  TextEditingController weightingredientsController =
      TextEditingController(text: '');
  TextEditingController informationingredientsController =
      TextEditingController(text: '');

  TextEditingController timetController = TextEditingController();
  TextEditingController searchController = TextEditingController(text: '');

  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  Rx<DateTime> dateStartChoose = DateTime.now().obs;

  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int indexPage = 1;
  ScrollController ingredientsscrollController = ScrollController();

  List<String> listStatusDropdown = <String>['Hàng tồn kho', 'Hàng xuất kho'];
  Rx<String> dropdownValue = "".obs;

  Rx<IngredientsDetail> currentIngredient = IngredientsDetail().obs;

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    dropdownValue.value = listStatusDropdown.first;
    try {
      isLoading(true);
      await refeshDataIngredient();
      isLoading(false);
    } catch (e) {
      Get.back();
      Get.snackbar("Bị lỗi ", e.toString());
      log(e.toString());
    }
    super.onInit();
    ingredientsscrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (ingredientsscrollController.position.pixels ==
        ingredientsscrollController.position.maxScrollExtent) {
      await fetchMoreData();
    }
  }

  fetchMoreData() async {
    try {
      if (noMoreRecord.value || lazyLoading.value) {
      } else {
        indexPage += 1;
        lazyLoading(true);
        await Future.delayed(const Duration(seconds: 1));
        List<IngredientsDetail> listTmp =
            await IngredientApi.getAllIngredients(indexPage);
        if (listTmp.isEmpty) {
          // Get.snackbar("Thông báo", "Hết dữ liệu");
          noMoreRecord(true);
        } else {
          listIngredients.value.addAll(listTmp);
        }
      }
    } finally {
      lazyLoading(false);
    }
  }

  refeshDataIngredient() async {
    try {
      isLoading(true);
      indexPage = 1;
      noMoreRecord(false);
      listIngredients.value = await IngredientApi.getAllIngredients(indexPage);
      showAll();
      isLoading(false);
    } catch (e) {
      log('err$e');
    }
  }

  setValueNameIngredients(String value) {
    print("hehe");
    nameingredients.value = value;
  }

  setValueQuantityIngredients(String value) {
    print("hehe");
    quantityingredients.value = value;
  }

  setValueWeightIngredients(String value) {
    print("hehe");
    weightingredients.value = value;
  }

  setValueInformationIngredients(String value) {
    print("hehe");
    informationingredients.value = value;
  }

  showAll() {
    listToView.clear();
    listToView.addAll(listIngredients);
  }

  onTypingSearch(String value) async {
    if (value.isNotEmpty) {
//search
      noMoreRecord(true);
      listIngredients.value =
          await IngredientApi.searchlistIngredientsDetail(value);
    } else {
      refeshDataIngredient();
    }
  }

  showDetails(IngredientsDetail model) {
    currentIngredient.value = model;
    Get.to(() => IngredientsDetailsView(
          id: model.id!,
        ));
  }

  showDataIngredients(IngredientsDetail model) {
    refeshFormIngredients();
    nameingredientsController.text = model.name!;
    moneyingredients(model.money);
    quantityingredientsController.text = model.quantity!;
    weightingredientsController.text = model.weight!;
    informationingredientsController.text = model.information!;
    timetController.text = model.time!;
    listImage(model.images);
    dropdownValue.value =
        model.status == 1 ? listStatusDropdown.first : listStatusDropdown.last;
    Get.to(() => CreateIngredientsView(
          idIngredient: model.id,
        ));
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
                      timetController.text = dateFormat.format(dates[0]!);
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

  onTabDeleteIamge(int index) {
    listImage.removeAt(index);
  }

  refeshFormIngredients() {
    nameingredientsController.text = "";
    moneyingredients(0);
    quantityingredientsController.text = "";
    weightingredientsController.text = "";
    informationingredientsController.text = '';
    timetController.text = "";
    listImage([]);
  }

  createIngredients(String? idIngredietns) async {
    log(nameingredientsController.text);
    log(quantityingredientsController.text);
    log(weightingredientsController.text);
    log(moneyingredients.toString());
    log(informationingredientsController.text);
    log(listImage.toString());
    log(dateStartChoose.toString());
    log("${dropdownValue == listStatusDropdown.first}");

    IngredientsModel formData = IngredientsModel(
      name: nameingredientsController.text,
      money: moneyingredients.value,
      quantity: quantityingredientsController.text,
      weight: weightingredientsController.text,
      status: dropdownValue.value == listStatusDropdown.first,
      information: informationingredientsController.text,
      time: DateFormat('yyyy-MM-dd').format(dateStartChoose.value),
      images: [],
    );
    bool check = idIngredietns != null
        ? await IngredientApi.updataIngredietns(
            formData, listImage, idIngredietns)
        : await IngredientApi.createIngredients(formData, listImage);
    if (check) {
      Get.back();
      refeshDataIngredient();
      Get.snackbar('Thông báo', 'Tạo nguyên liệu thành công',
          backgroundColor: Colors.green.withOpacity(0.7),
          colorText: Colors.white);
    } else {
      Get.snackbar('Thông báo', 'Tạo nguyên liệu không thành công',
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    }
  }

  deleteDataRequestForm(String idIngredients) async {
    try {
      bool check = await IngredientApi.deleteIngredients(idIngredients);
      if (check) {
        //thông báo true
        refeshDataIngredient();
        Get.to(() => const IngredientsView());
        Get.snackbar('Thông báo', 'Xóa nguyên liệu thành công',
            backgroundColor: Colors.green.withOpacity(0.7),
            colorText: Colors.white);
      } else {
        Get.snackbar('Thông báo', 'Xóa nguyên liệu không thành công',
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
