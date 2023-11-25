import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/util/view_utils.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/client_farm/client_api.dart';
import 'package:itfsd/data/network/api/supplier/supplier.dart';
import 'package:itfsd/presentation/page/supplier/create_supplier.dart';
import 'package:itfsd/data/model/supplier/supplier_detail.dart';
import 'package:itfsd/data/model/supplier/supplier_model.dart';

class SupplierController extends BaseController {
  ScrollController supplierscrollController = ScrollController();

  Rx<String> namesupplier = "".obs;
  Rx<String> addresss = "".obs;
  Rx<int> debt = 0.obs;
  Rx<String> phonenumber = "".obs;
  Rx<String> description = "".obs;

  TextEditingController namesupplierController = TextEditingController();
  TextEditingController addresssController = TextEditingController();
  TextEditingController debtController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  RxList<SupplierDetail> listSupplier = <SupplierDetail>[].obs;
  RxList<SupplierDetail> listToView = <SupplierDetail>[].obs;

  TextEditingController searchController = TextEditingController(text: '');
  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int indexPage = 1;

  Rx<int> itemCount = 0.obs;

  @override
  Future<void> onInit() async {
    try {
      isLoading(true);
      await refreshData();
    } catch (e) {
      ViewUtils.handleInitError(e);
    } finally {
      isLoading(false);
    }
    supplierscrollController = ScrollController()..addListener(scrollListener);
    super.onInit();
  }


  @override
  void onClose() {
    supplierscrollController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    supplierscrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    final position = supplierscrollController.position;
    if (position.haveDimensions &&
        position.maxScrollExtent > 0) {
      final isScrollAtEnd = position.pixels == position.maxScrollExtent;
      if (isScrollAtEnd) {
        fetchMoreData();
      }
    }
  }

  Future<void> fetchMoreData() async {
    try {
      if (noMoreRecord.value || lazyLoading.value) return;
      indexPage += 1;
      lazyLoading(true);
      await Future.delayed(const Duration(seconds: 1));

      List<SupplierDetail> listTmp =
          await SupplierApi.getAllDataSupplier(indexPage);
      updateItemCount();

      if (listTmp.isEmpty) {
        noMoreRecord(true);
      }
      listSupplier.addAll(listTmp);
    } catch (e) {
      log('Error fetching more data: $e');
    } finally {
      lazyLoading(false);
    }
  }

  // Future<void> fetchMoreData() async {
  //   try {
  //     if (noMoreRecord.value || lazyLoading.value) {
  //       return;
  //     }
  //     // Show loading indicator
  //     lazyLoading(true);
  //     List<SupplierDetail> listTmp =
  //         await SupplierApi.getAllDataSupplier(indexPage);
  //     // Introduce a short delay (optional)
  //     // await Future.delayed(Duration(milliseconds: 500));
  //     updateItemCount();
  //     if (listTmp.isEmpty) {
  //       noMoreRecord(true);
  //     } else {
  //       listSupplier.addAll(listTmp);
  //     }
  //   } catch (e) {
  //     // Handle errors, e.g., show an error message
  //     log('Error fetching more data: $e');
  //     // Optionally: Show an error message to the user
  //   } finally {
  //     // Hide loading indicator whether successful or not
  //     lazyLoading(false);
  //   }
  // }

  void setValueName(String value) => namesupplier.value = value;

  void setValueAddress(String value) => addresss.value = value;

  void setValuephonenumber(String value) => phonenumber.value = value;

  void setValueNote(String value) => description.value = value;

  void updateItemCount() => itemCount(listSupplier.length);

  Future<void> refreshData() async {
    try {
      // Show loading indicator
      isLoading(true);
      indexPage = 1;
      noMoreRecord(false);
      listSupplier.value = await SupplierApi.getAllDataSupplier(indexPage);
      // Introduce a short delay (optional)
      // await Future.delayed(Duration(milliseconds: 500));
      updateItemCount();
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

  void showAll() {
    listToView.clear();
    listToView.addAll(listSupplier);
  }

  void refreshForm() {
    namesupplierController.text = "";
    addresssController.text = "";
    debt(0);
    debtController.text = "";
    phonenumberController.text = "";
    descriptionController.text = "";
  }

  void showData(SupplierDetail supplierid) {
    // Reset the form fields
    refreshForm();
    // Populate form fields with data from the selected supplier
    namesupplierController.text = supplierid.name;
    addresssController.text = supplierid.address;
    // Convert debt to string for the text field
    debt(supplierid.debt);
    debtController.text = supplierid.debt.toString();
    // Update the observable debt value

    phonenumberController.text = supplierid.phoneNumber;
    descriptionController.text = supplierid.description;
    // Navigate to the Moresupplier page with the supplier ID
    Get.to(() => Moresupplier(idsupplier: supplierid.id));
  }

  Future<void> createSupplier(String? idsupplier) async {
    Supplier formData = Supplier(
      name: namesupplierController.text,
      address: addresssController.text,
      debt: debt.value,
      phoneNumber: phonenumberController.text,
      description: descriptionController.text,
    );
    bool check = idsupplier != null
        ? await SupplierApi.updateSupplier(idsupplier, formData)
        : await SupplierApi.createSupplier(formData);

    if (check) {
      Get.back();
      ViewUtils.showSnackbarMessage("Tạo nhà cung cấp thành công", check);
      refreshData(); // Corrected function name
    } else {
      ViewUtils.showSnackbarMessage("Tạo nhà cung cấp không thành công", check);
    }
  }

  Future<void> deleteData(String idClient) async {
    try {
      bool check = await ClientApi.deletecontactApi(idClient);
      if (check) {
        Get.offAndToNamed(Routes.SUPPLIER);
        ViewUtils.showSnackbarMessage("Xóa nhà cung cấp thành công", check);
      }
    } catch (e) {
      ViewUtils.handleError();
    } finally {
      refreshData();
    }
  }

  Future<void> onTypingSearch(String value) async {
    if (value.isNotEmpty) {
      noMoreRecord(true);
      listSupplier.value = await SupplierApi.searchMaterial(value);
    } else {
      refreshData();
    }
  }

  void increment() => itemCount.value++;
}
