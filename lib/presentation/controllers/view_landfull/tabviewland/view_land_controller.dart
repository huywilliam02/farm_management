import 'package:itfsd/data/model/land/land_detail.dart';
import 'package:itfsd/data/network/api/view_landfull/land_division.dart';
import 'package:get/get.dart';
import 'package:itfsd/data/model/land/land.dart';

class ViewLandController extends GetxController {
  final count = 0.obs;
  RxList<LandDetail> listLand = <LandDetail>[].obs;
  Rx<String> idLandChoose = "".obs;
  final isLoading = true.obs;
  @override
  Future<void> onInit() async {
    await refeshDataLand();

    super.onInit();
  }



  refeshDataLand() async {
    try {
      isLoading(true);
      var products = await LanddivisionApi.getAllLand();
      listLand.value = products;
        } finally {
      isLoading(false);
    }
  }
}
