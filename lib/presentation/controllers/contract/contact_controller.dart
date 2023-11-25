import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/client_farm/client_api.dart';
import 'package:itfsd/data/network/api/otherobjectApi/otherobjectApi.dart';
import 'package:itfsd/data/network/api/supplier/supplier.dart';
import 'package:itfsd/data/model/client_farm/client_detail.dart';
import 'package:itfsd/data/model/otherobject/otherObject_detail.dart';
import 'package:itfsd/data/model/supplier/supplier_detail.dart';

class ContactController extends BaseController {
  //TODO: Implement ContactController

  RxList<ClientDetail> listClient = <ClientDetail>[].obs;
  RxList<ClientDetail> listToViewClient = <ClientDetail>[].obs;

  RxList<SupplierDetail> listSupplier = <SupplierDetail>[].obs;
  RxList<SupplierDetail> listToViewSupplier = <SupplierDetail>[].obs;

  RxList<OtherObjectDetail> listOtherObject = <OtherObjectDetail>[].obs;
  RxList<OtherObjectDetail> listToViewOtherObject = <OtherObjectDetail>[].obs;

  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int indexPage = 1;
  ScrollController scrollController = ScrollController();

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    try {
      isLoading(true);
      // await getAllClient();
      await refeshData();
      // await refeshDataSupplier();
      isLoading(false);
    } catch (e) {
      Get.back();
      Get.snackbar("Bị lỗi ", e.toString());
      log(e.toString());
    }
    super.onInit();
  }



  refeshData() async {
    try {
      isLoading(true);
      listClient.value = await ClientApi.getAllDataClient(indexPage);
      listSupplier.value = await SupplierApi.getAllDataSupplier(indexPage);
      listOtherObject.value =
          await OtherObjectApi.getAllDataOtherObject(indexPage);
      showAll();
      isLoading(false);
    } catch (e) {
      log('err$e');
    }
  }

  // refeshDataSupplier() async {
  //   try {
  //     isLoading(true);
  //     listSupplier.value = await SupplierApi.getAllDataSupplier();

  //     showAll();
  //     isLoading(false);
  //   } catch (e) {
  //     log('err' + e.toString());
  //   }
  // }

  showAll() {
    listToViewClient.clear();
    listToViewClient.addAll(listClient);
    listToViewSupplier.clear();
    listToViewSupplier.addAll(listSupplier);
    listToViewOtherObject.clear();
    listToViewOtherObject.addAll(listOtherObject);
  }

  void increment() => count.value++;
}
