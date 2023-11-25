import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/farm/farm.dart';
import 'package:itfsd/data/network/api/farming_calendar/farmingcalendar_api.dart';

import 'package:itfsd/data/model/category/product.dart';
import 'package:itfsd/data/model/farm/farm.dart';

class UnitfarmController extends BaseController {
  RxList<Product> listunit = <Product>[].obs;
  // RxBool loadingunit = true.obs;
  final isLoading = true.obs;

  Rx<String> name = "".obs;
  Rx<String> description = "".obs;

  TextEditingController nameUnitController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final count = 0.obs;
  @override
  Future<void> onInit() async {
    await getAllUnit();
    await refeshDataFarm();
    super.onInit();
  }

  RxList<Farm> listFarm = <Farm>[].obs;


  setValueName(String value) {
    print("hehe");
    name.value = value;
  }

  setValueDescription(String value) {
    print("hehe");
    description.value = value;
  }

  getAllUnit() async {
    listunit.value =
        await FarmingcalendarApi.getAllDataByTypeCategory("UNIT_TYPE");
  }

  refeshDataFarm() async {
    try {
      isLoading(true);
      var farm = await FarmApi.getAllFarm();
      listFarm.value = farm;
        } finally {
      isLoading(false);
    }
  }

 

  void increment() => count.value++;
}
