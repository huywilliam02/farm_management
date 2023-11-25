import 'dart:developer';

import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/view_area/more_land.dart';
import 'package:get/get.dart';
import 'package:itfsd/data/model/area/moreLand.dart';

class ViewAreaController extends BaseController {
  //TODO: Implement ViewAreaController

  final count = 0.obs;
  RxList<MorelandModel> listArea = <MorelandModel>[].obs;
  final isLoading = true.obs;
  @override
  Future<void> onInit() async {
    await refeshData();
    super.onInit();
  }



  refeshData() async {
    try {
      isLoading(true);
      listArea.value = await MoreLandApi.getAllArea();
      // showAll();

      isLoading(false);
    } catch (e) {
      log('err$e');
    }
  }
}
