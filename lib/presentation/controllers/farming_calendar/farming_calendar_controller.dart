import 'dart:developer';

import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/farming_calendar/farmingcalendar_api.dart';
import 'package:itfsd/data/network/api/view_landfull/land_division.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:itfsd/data/model/category/product.dart';
import 'package:itfsd/data/model/category/unit.dart';
import 'package:itfsd/data/model/farming_calendar/form_schedule.dart';
import 'package:itfsd/data/model/farming_calendar/schedule-detail.dart';
import 'package:itfsd/data/model/land/land.dart';
import 'package:itfsd/data/model/user/user.dart';
import 'package:itfsd/presentation/page/farming_calendar/farming_calendar_view.dart';
import 'package:itfsd/presentation/page/farming_calendar/view-all-schedule.dart';

class FarmingCalendarController extends BaseController {
  //TODO: Implement FarmingCalendarController

  TextEditingController landController =
      TextEditingController(text: 'Mời chọn vùng canh tác');
  TextEditingController productController =
      TextEditingController(text: 'Mời chọn loại sản phẩm');
  TextEditingController unitController = TextEditingController(text: 'Đơn vị');
  TextEditingController userController =
      TextEditingController(text: 'Người thực hiện');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController seedProviderController =
      TextEditingController(text: '');
  TextEditingController numberOfVaritesController =
      TextEditingController(text: '');
  TextEditingController expectOutputController =
      TextEditingController(text: '');

  RxList<LandDivision> listLand = <LandDivision>[].obs;
  RxList<UnitModel> unitModel = <UnitModel>[].obs;
  RxList<Product> listProduct = <Product>[].obs;
  RxList<Product> listUnit = <Product>[].obs;
  RxList<User> listUser = <User>[].obs;
  RxList<DetailSchedule> listSchedule = <DetailSchedule>[].obs;
  RxList<DetailSchedule> listToView = <DetailSchedule>[].obs;
  Rx<String> idLandChoose = "".obs;
  Rx<String> idproductnameChoose = "".obs;
  Rx<String> nameproduct = "".obs;
  Rx<String> seedProvider = "".obs;
  Rx<int> numberOfVarites = 0.obs;
  Rx<int> expectOutput = 0.obs;
  Rx<String> startTime = "".obs;
  Rx<String> endtime = "".obs;
  RxList<String> listIdUserChoose = <String>[].obs;

  Rx<String> unitChoose = "".obs;
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  Rx<DateTime> dateStartChoose = DateTime.now().obs;
  Rx<DateTime> dateEndChoose = DateTime.now().add(const Duration(days: 2)).obs;

  Rx<LandDivision> landChoose = LandDivision().obs;

  TextEditingController dateStartController = TextEditingController(text: '');
  TextEditingController dateEndController = TextEditingController(text: '');

  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int indexPage = 1;
  ScrollController farmingCalendarscrollController = ScrollController();

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    dateStartController.text = dateFormat.format(DateTime.now());
    dateEndController.text = dateFormat.format(
      DateTime.now().add(
        const Duration(days: 2),
      ),
    );

    try {
      isLoading(true);
      await refeshData();
      await getAllLandapi();
      await getAllProduct();
      await getAllUnit();
      await getAllUser();
      isLoading(false);
    } catch (e) {
      Get.back();
      Get.snackbar("SomeThingWrong", e.toString());
      log(e.toString());
    }
    super.onInit();
    farmingCalendarscrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (farmingCalendarscrollController.position.pixels ==
        farmingCalendarscrollController.position.maxScrollExtent) {
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
        List<DetailSchedule> listTmp =
            await FarmingcalendarApi.getAllSchedule(indexPage);
        if (listTmp.isEmpty) {
          // Get.snackbar("Thông báo", "Hết dữ liệu");
          noMoreRecord(true);
        } else {
          listSchedule.value.addAll(listTmp);
        }
      }
    } finally {
      lazyLoading(false);
    }
  }

  getAllLandapi() async {
    listLand.value = await LanddivisionApi.getAllLand();
    landChoose(listLand.value.first);
    idLandChoose(listLand.first.id);
  }

  getAllProduct() async {
    listProduct.value =
        await FarmingcalendarApi.getAllDataByTypeCategory("PRODUCT_TYPE");
  }

  getAllUnit() async {
    listUnit.value =
        await FarmingcalendarApi.getAllDataByTypeCategory("UNIT_TYPE");
  }

  getAllUser() async {
    listUser.value = await FarmingcalendarApi.getAllUser();
  }

  refeshData() async {
    try {
      isLoading(true);
      indexPage = 1;
      noMoreRecord(false);
      listSchedule.value = await FarmingcalendarApi.getAllSchedule(indexPage);
      showAll();
      isLoading(false);
    } catch (e) {
      log('err$e');
    }
  }

  showAll() {
    listToView.clear();
    listToView.addAll(listSchedule);
  }

  void increment() => count.value++;

  chooseLand(LandDivision model) {
    idLandChoose(model.id);
    landController.text = model.name!;
  }

  chooseProduct(Product product) {
    idproductnameChoose(product.id);

    productController.text = product.name!;
  }

  chooseUnit(String nameUnit) {
    unitChoose(nameUnit);
    unitController.text = nameUnit;
  }

  chooseUser(String id) {
    if (listIdUserChoose.contains(id)) {
      listIdUserChoose.remove(id);
    } else {
      listIdUserChoose.add(id);
    }
    if (listIdUserChoose.isEmpty) {
      userController.text = 'Người thực hiện';
    } else {
      userController.text = '${listIdUserChoose.length} người được chọn';
    }
  }

  setValueS(DateTime value) {
    startTime.value = DateFormat("yyyy-MM-dd").format(value).toString();
  }

  setValueNameProduct(String value) {
    print("hehe");
    nameproduct.value = value;
  }

  setValueseedProvider(String value) {
    print("hehe");
    seedProvider.value = value;
  }

  setValuenumberOfVarites(String value) {
    numberOfVarites.value = int.tryParse(value) ?? 0;
  }

  showData(DetailSchedule schedule) {
    refeshForm();
    idLandChoose(schedule.land!.id);
    idproductnameChoose(schedule.productType!.id!);
    landController.text = schedule.land!.name!;
    productController.text = schedule.productType!.name!;
    nameController.text = schedule.productName!;
    numberOfVaritesController.text = schedule.numberOfVarites!.toString();
    numberOfVarites(schedule.numberOfVarites);
    dateEndChoose.value = schedule.endDate!;
    dateStartChoose.value = schedule.startDay!;
    dateStartController.text = dateFormat.format(schedule.startDay!);
    dateEndController.text = dateFormat.format(schedule.endDate!);
    seedProviderController.text = schedule.seedProvider!;
    expectOutput(schedule.expectOutput);
    for (var element in schedule.users!) {
      listIdUserChoose.add(element.id!);
    }
    unitChoose(schedule.unit);
    unitController.text = schedule.unit!;
    Get.to(() => FarmingCalendarView(
          idDetail: schedule.id,
        ));
  }

  refeshForm() {
    idLandChoose("");
    idproductnameChoose("");
    nameController.text = "";
    landController.text = 'Mời chọn vùng canh tác';
    productController.text = 'Mời chọn loại sản phẩm';
    numberOfVarites(0);
    dateStartController.text = dateFormat.format(DateTime.now());
    dateEndController.text =
        dateFormat.format(DateTime.now().add(const Duration(days: 2)));
    seedProviderController.text = "";
    expectOutput(0);
    unitChoose(listUnit[0].name);
    unitController.text = 'Đơn vị';
    listIdUserChoose([]);
  }

  createSchedule(String? idDetail) async {
    log(idLandChoose.value);
    log(idproductnameChoose.value);
    log(nameController.text);
    log(numberOfVarites.value.toString());
    log(dateStartController.text.toString());
    log(dateEndController.text.toString());
    log(seedProviderController.text.toString());
    log(expectOutput.value.toString());
    log(unitChoose.toString());
    log(listIdUserChoose.toList().toString());
    FormCreateSchedule formData = FormCreateSchedule(
      productName: nameController.text,
      productTypeId: idproductnameChoose.value,
      numberOfVarites: numberOfVarites.value,
      startDay: DateFormat('yyyy-MM-dd').format(dateStartChoose.value),
      endDate: DateFormat('yyyy-MM-dd').format(dateEndChoose.value),
      seedProvider: seedProviderController.text,
      expectOutput: expectOutput.value,
      unit: unitChoose.value,
      users: listIdUserChoose.value,
    );
    bool check = idDetail != null
        ? await FarmingcalendarApi.updateSchedule(idDetail, formData)
        : await FarmingcalendarApi.createSchedule(idLandChoose.value, formData);
    if (check) {
      Get.back();
      refeshData();
      Get.snackbar('Thông báo', 'Cập nhật lịch thành công',
          backgroundColor: Colors.green.withOpacity(0.7),
          colorText: Colors.white);
    } else {
      Get.snackbar('Thông báo', 'Tạo lịch không thành công',
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    }
  }

  chooseDate(bool isStart) async {
    DateTime dateTime = isStart
        ? dateStartChoose.value
        : dateStartChoose.value.add(const Duration(days: 2));
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
                      dateStartController.text = dateFormat.format(dates[0]!);
                      dateEndChoose(dates[0]!.add(const Duration(days: 2)));
                      dateEndController.text = dateFormat
                          .format(dates[0]!.add(const Duration(days: 2)));
                      log(dateEndChoose.toString());
                    } else {
                      dateEndChoose(dates[0]);
                      dateEndController.text = dateFormat.format(dates[0]!);
                    }
                    Get.back();
                  },
                  value: [
                    isStart ? dateStartChoose.value : dateEndChoose.value
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  deleteData(String idfarmingcalender) async {
    try {
      bool check =
          await FarmingcalendarApi.deletefarmingcalender(idfarmingcalender);
      if (check) {
        //thông báo true
        refeshData();
        Get.to(() => const ViewAllSchedule());
      } else {
        //thông báo fail
      }
    } catch (e) {
      Get.back();
      Get.snackbar("title", "Có gì đó không đúng");
    }
  }

  onTypingSearchFarmingcalendar(String value) async {
    if (value.isNotEmpty) {
//search
      noMoreRecord(true);
      listSchedule.value =
          await FarmingcalendarApi.searchlistDetailSchedule(value);
    } else {
      refeshData();
    }
  }
}
