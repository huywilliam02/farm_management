import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/customer/customer.dart';
import 'package:itfsd/presentation/page/customer/customer_view.dart';
import 'package:itfsd/presentation/page/customer/customer_pageview.dart';
import 'package:itfsd/app/core/constants/app_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:itfsd/data/model/customer/customer_detail.dart';
import 'package:itfsd/data/model/customer/customer_model.dart';

class CustomerController extends BaseController {
  //TODO: Implement CustomerController
  Rx<String> name = "".obs;
  Rx<int> quantity = 0.obs;
  Rx<String> receptionDay = "".obs;
  Rx<String> description = "".obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController receptionDayController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  Rx<DateTime> dateStartChoose = DateTime.now().obs;

  RxList<CustomerDetail> listCustomer = <CustomerDetail>[].obs;
  RxList<CustomerDetail> listToView = <CustomerDetail>[].obs;

  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int indexPage = 1;
  ScrollController customerscrollController = ScrollController();
  List<String> listStatusDropdown = <String>['Chưa thăm quan', 'Đã thăm quan'];
  Rx<String> dropdownValue = "".obs;
  final count = 0.obs;
  @override
  Future<void> onInit() async {
    receptionDayController.text = dateFormat.format(DateTime.now());
    dropdownValue.value = listStatusDropdown.first;
    try {
      isLoading(true);
      await refeshData();
      isLoading(false);
    } catch (e) {
      Get.back();
      Get.snackbar("SomeThingWrong", e.toString());
      log(e.toString());
    }
    super.onInit();
    customerscrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (customerscrollController.position.pixels ==
        customerscrollController.position.maxScrollExtent) {
      await fetchMoreData();
    }
  }

  fetchMoreData() async {
    try {
      if (noMoreRecord.value) {
      } else {
        indexPage += 1;
        lazyLoading(true);
        await Future.delayed(const Duration(seconds: 1));
        List<CustomerDetail> listTmp =
            await CustomerApi.getAllCustomer(indexPage);
        if (listTmp.isEmpty) {
          // Get.snackbar("Thông báo", "Hết dữ liệu");
          noMoreRecord(true);
        } else {
          listCustomer.value.addAll(listTmp);
        }
      }
    } finally {
      lazyLoading(false);
    }
  }

  setValueName(String value) {
    print("hehe");
    name.value = value;
  }

  setValuedescription(String value) {
    print("hehe");
    description.value = value;
  }

  showAll() {
    listToView.clear();
    listToView.addAll(listCustomer);
  }

  showData(CustomerDetail model) {
    // refeshForm();
    nameController.text = model.name;
    descriptionController.text = model.description;
    dropdownValue.value =
        model.status == 1 ? listStatusDropdown.first : listStatusDropdown.last;

    Get.to(
      () => MoreCustomerView(
        idCustomer: model.id,
      ),
    );
  }

  refeshData() async {
    try {
      isLoading(true);
      indexPage = 1;
      noMoreRecord(false);
      listCustomer.value = await CustomerApi.getAllCustomer(indexPage);
      showAll();
      isLoading(false);
    } catch (e) {
      log('err$e');
    }
  }

  createCustomer(String? idCustomer) async {
    log(descriptionController.text);

    CustomerModel formData = CustomerModel(
      name: nameController.text,
      quantity: quantity.value,
      receptionDay: DateFormat('dd-MM-yyyy').format(dateStartChoose.value),
      description: descriptionController.text,
      status: dropdownValue.value == listStatusDropdown.first,
    );
    bool check = idCustomer != null
        ? await CustomerApi.updateCustomer(idCustomer, formData)
        : await CustomerApi.createcustomer(formData);
    if (check) {
      Get.back();
      refeshData();
      Get.snackbar('Thông báo', 'Tạo khách tham quan thành công',
          backgroundColor: Colors.green.withOpacity(0.7),
          colorText: Colors.white);
    } else {
      Get.snackbar('Thông báo', 'Tạo khách tham quan thành công',
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
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
                      receptionDayController.text =
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

  deleteData(String idCustomer) async {
    try {
      bool check = await CustomerApi.deleteCustomerApi(idCustomer);
      if (check) {
        //thông báo true
        refeshData();
        Get.to(() => const CustomerView());
        Get.snackbar('Thông báo', 'Xóa nhà cung cấp thành công',
            backgroundColor: Colors.green.withOpacity(0.7),
            colorText: Colors.white);
      } else {
        Get.snackbar('Thông báo', 'Xóa nhà cung cấp không thành công',
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
