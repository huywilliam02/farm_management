import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/data/network/api/material/material_api.dart';
import 'package:itfsd/data/network/api/requestform/requestform_api.dart';

import 'package:itfsd/data/network/api/supplier/supplier.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/model/material/materialdetail.dart';
import 'package:itfsd/data/model/requestform/requestfarm.dart';
import 'package:itfsd/data/model/requestform/requestformDetail.dart';
import 'package:itfsd/data/model/supplier/supplier_detail.dart';
import 'package:itfsd/presentation/page/requestform/requestform_page.dart';
import 'package:itfsd/presentation/page/requestform/more_request_form_view.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class RequestformController extends BaseController {
  RxBool isLoading = true.obs;
  Rx<String> name = "".obs;
  Rx<int> quantity = 0.obs;
  Rx<String> idmaterialChoose = "".obs;
  Rx<String> description = "".obs;
  Rx<String> idproviderChoose = "".obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController idmaterialChooseController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController idproviderChooseController = TextEditingController();

  RxList<MaterialDetail> listMaterialRequestform = <MaterialDetail>[].obs;
  RxList<SupplierDetail> listSupplierRequestform = <SupplierDetail>[].obs;
  RxList<RequestFormDetail> listRequestForm = <RequestFormDetail>[].obs;
  RxList<RequestFormDetail> listToViewRequestForm = <RequestFormDetail>[].obs;

  TextEditingController searchController = TextEditingController(text: '');
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int indexPage = 1;
  ScrollController requestformController = ScrollController();

  List<String> listStatusDropdown = <String>['Đã xác nhận', 'Đang chờ'];
  Rx<String> dropdownValue = "".obs;
  Rx<int> itemCount = 0.obs;

  final count = 0.obs;

  @override
  Future<void> onInit() async {
    dropdownValue.value = listStatusDropdown.first;
    try {
      isLoading(true);
      await getAllMaterial();
      await getAllSupplier();
      await refeshDataRequestForm();
      isLoading(false);
    } catch (e) {
      Get.back();
      Get.snackbar("SomeThingWrong", e.toString());
      log(e.toString());
    }
    requestformController.addListener(_scrollListener);
    super.onInit();
  }

  @override
  void dispose() {
    requestformController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    requestformController.dispose();
    super.onClose();
  }

  void updateItemCount() => itemCount(listRequestForm.length);
  setValueName(String value) {
    print("hehe");
    name.value = value;
  }

  setValueDescription(String value) {
    print("hehe");
    description.value = value;
  }

  RxString selectedMaterialName = RxString('');

  chooseMaterial(MaterialDetail model) {
    idmaterialChoose(model.id);
    idmaterialChooseController.text = model.name;
    selectedMaterialName.value = model.name ?? '';
    // update();
  }

  chooseSupplier(SupplierDetail model) {
    idproviderChoose(model.id);
    idproviderChooseController.text = model.name;
  }

  getAllMaterial() async {
    listMaterialRequestform.value =
        await MaterialApi.getAllDataMaterial(indexPage);
  }

  getAllSupplier() async {
    listSupplierRequestform.value =
        await SupplierApi.getAllDataSupplier(indexPage);
  }

  void _scrollListener() async {
    if (requestformController.position.pixels ==
        requestformController.position.maxScrollExtent) {
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
        List<RequestFormDetail> listTmp =
            await RequestFormApi.getAllDataRequestForm(indexPage);
        updateItemCount();
        if (listTmp.isEmpty) {
          // Get.snackbar("Thông báo", "Hết dữ liệu");
          noMoreRecord(true);
        } else {
          listRequestForm.value.addAll(listTmp);
        }
        lazyLoading(false);
      }
    } catch (e) {}
  }

  refeshDataRequestForm() async {
    try {
      isLoading(true);
      indexPage = 1;
      noMoreRecord(false);
      listRequestForm.value =
          await RequestFormApi.getAllDataRequestForm(indexPage);
      updateItemCount();
      showAll();
      isLoading(false);
    } catch (e) {
      log('err$e');
    }
  }

  showAll() {
    listToViewRequestForm.clear();
    listToViewRequestForm.addAll(listToViewRequestForm);
  }

  showData(RequestFormDetail model) {
    refeshForm();
    nameController.text = model.name;
    idmaterialChoose(model.material.id);
    idmaterialChooseController.text = model.material.name;
    quantity(model.quantity);
    descriptionController.text = model.description;
    idproviderChoose(model.provider.id);
    idproviderChooseController.text = model.provider.name;
    dropdownValue.value =
        model.status == 1 ? listStatusDropdown.first : listStatusDropdown.last;
    Get.to(
      () => RequestformView(
        idrequestform: model.id,
      ),
    );
  }

  refeshForm() {
    idmaterialChoose("");
    idmaterialChooseController.text = "";
    idproviderChooseController.text = "";
    nameController.text = "";
    quantity(0);
    descriptionController.text = "";
    idproviderChoose("");
  }

  createRequestForm(String? idRequestform) async {
    log(nameController.text);
    log(idmaterialChoose.toString());
    log(quantity.value.toString());
    log(descriptionController.text);
    log(idproviderChoose.toString());
    RequestForm formData = RequestForm(
      // name: namesupplier.value,
      // address: addresss.value,
      name: nameController.text,
      material: idmaterialChoose.value,
      quantity: quantity.value,
      description: descriptionController.text,
      provider: idproviderChoose.value,
      status: dropdownValue.value == listStatusDropdown.first ? 1 : 2,
      // status: dropdownValue.value == listStatusDropdown.first,
    );

    bool check = idRequestform != null
        ? await RequestFormApi.updateRequestForm(idRequestform, formData)
        : await RequestFormApi.createRequestForm(formData);
    if (check) {
      Get.back();
      refeshDataRequestForm();
      Get.snackbar('Thông báo', 'Tạo phiếu thành công',
          backgroundColor: Colors.green.withOpacity(0.7),
          colorText: Colors.white);
    } else {
      Get.snackbar('Thông báo', 'Tạo phiếu không thành công',
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    }
  }

  deleteDataRequestForm(String idRequestform) async {
    try {
      bool check = await RequestFormApi.deleteRequestform(idRequestform);
      if (check) {
        //thông báo true
        refeshDataRequestForm();
        Get.to(() => const RequestformViewAll());
        Get.snackbar('Thông báo', 'Xóa phiếu thành công',
            backgroundColor: Colors.green.withOpacity(0.7),
            colorText: Colors.white);
      } else {
        Get.snackbar('Thông báo', 'Xóa phiếu không thành công',
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    } catch (e) {
      Get.back();
      Get.snackbar("Lỗi", "Có gì đó không đúng");
    }
  }

  onTypingRequestFormDetail(String value) async {
    if (value.isNotEmpty) {
//search
      noMoreRecord(true);
      listRequestForm.value =
          await RequestFormApi.searchlistRequestFormDetail(value);
    } else {
      refeshDataRequestForm();
    }
  }

  void increment() => count.value++;
}
