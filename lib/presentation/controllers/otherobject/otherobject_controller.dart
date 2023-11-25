import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/client_farm/client_api.dart';
import 'package:itfsd/data/network/api/otherobjectApi/otherobjectApi.dart';
import 'package:itfsd/presentation/page/otherobject/more_OtherObject_view.dart';
import 'package:itfsd/presentation/page/otherobject/otherobject_view.dart';
import 'package:itfsd/data/model/otherobject/otherObjectModel.dart';
import 'package:itfsd/data/model/otherobject/otherObject_detail.dart';

class OtherobjectController extends BaseController {
  Rx<String> nameOtherObject = "".obs;
  Rx<String> addresss = "".obs;
  Rx<int> debt = 0.obs;
  Rx<String> phonenumber = "".obs;
  Rx<String> description = "".obs;

  TextEditingController nameOtherObjectController = TextEditingController();
  TextEditingController addresssController = TextEditingController();
  TextEditingController debtController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  RxList<OtherObjectDetail> listOtherObject = <OtherObjectDetail>[].obs;
  RxList<OtherObjectDetail> listToView = <OtherObjectDetail>[].obs;
  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int indexPage = 1;
  ScrollController otherobjectscrollController = ScrollController();
  final count = 0.obs;
  @override
  Future<void> onInit() async {
    try {
      isLoading(true);
      await refeshData();
      isLoading(false);
    } catch (e) {
      Get.back();
      Get.snackbar("Bị lỗi ", e.toString());
      log(e.toString());
    }
    super.onInit();
    otherobjectscrollController.addListener(_scrollListener);
  }



  void _scrollListener() async {
    if (otherobjectscrollController.position.pixels ==
        otherobjectscrollController.position.maxScrollExtent) {
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
        List<OtherObjectDetail> listTmp =
            await OtherObjectApi.getAllDataOtherObject(indexPage);
        if (listTmp.isEmpty) {
          // Get.snackbar("Thông báo", "Hết dữ liệu");
          noMoreRecord(true);
        } else {
          listOtherObject.value.addAll(listTmp);
        }
      }
    } finally {
      lazyLoading(false);
    }
  }

  setValueName(String value) {
    print("hehe");
    nameOtherObject.value = value;
  }

  setValueAddress(String value) {
    print("hehe");
    addresss.value = value;
  }

  setValuephonenumber(String value) {
    print("hehe");
    phonenumber.value = value;
  }

  setValueNote(String value) {
    print("hehe");
    description.value = value;
  }

  refeshData() async {
    try {
      isLoading(true);
      indexPage = 1;
      noMoreRecord(false);
      listOtherObject.value =
          await OtherObjectApi.getAllDataOtherObject(indexPage);
      showAll();
      isLoading(false);
    } catch (e) {
      log('err$e');
    }
  }

  showAll() {
    listToView.clear();
    listToView.addAll(listOtherObject);
  }

  refeshForm() {
    nameOtherObjectController.text = "";
    addresssController.text = "";
    debt(0);
    phonenumberController.text = "";
    descriptionController.text = "";
  }

  // getAllClient() async {
  //   listOtherObject.value = await OtherObjectApi.getAllDataOtherObject();
  // }

  showData(OtherObjectDetail otherObjectid) {
    refeshForm();
    nameOtherObjectController.text = otherObjectid.name;
    addresssController.text = otherObjectid.address;
    debt(otherObjectid.debt);
    phonenumberController.text = otherObjectid.phoneNumber;
    descriptionController.text = otherObjectid.description;
    Get.to(() => MoreOtherObjectView(
          idOtherObject: otherObjectid.id,
        ));
  }

  createClient(String? idClient) async {
    log(nameOtherObjectController.text);
    log(addresssController.text);
    log(debt.value.toString());
    log(phonenumberController.text);
    log(descriptionController.text);
    OtherObjectModel formData = OtherObjectModel(
      // name: namesupplier.value,
      // address: addresss.value,
      name: nameOtherObjectController.text,
      address: addresssController.text,
      debt: debt.value,
      phoneNumber: phonenumberController.text,
      description: descriptionController.text,
    );
    // bool check = await SupplierApi.createSupplier(formData);
    bool check = idClient != null
        ? await OtherObjectApi.updateOtherObject(idClient, formData)
        : await OtherObjectApi.createOtherObject(formData);
    if (check) {
      Get.back();
      refeshData();
      Get.snackbar('Thông báo', 'Tạo đối tượng khác thành công',
          backgroundColor: Colors.green.withOpacity(0.7),
          colorText: Colors.white);
    } else {
      Get.snackbar('Thông báo', 'Tạo đối tượng khác không thành công',
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    }
    update();
  }

  deleteData(String idClient) async {
    try {
      bool check = await ClientApi.deletecontactApi(idClient);
      if (check) {
        //thông báo true
        refeshData();
        Get.to(() => const OtherobjectView());
      } else {
        //thông báo fail
      }
    } catch (e) {
      Get.back();
      Get.snackbar("Lỗi", "Có gì đó không đúng");
    }
  }

  void increment() => count.value++;
}
