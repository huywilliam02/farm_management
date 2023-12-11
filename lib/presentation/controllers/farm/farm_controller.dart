import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/model/farm/farm_detail.dart';
import 'package:itfsd/data/network/api/farm/farm.dart';
import 'package:itfsd/data/model/category/product.dart';
import 'package:itfsd/presentation/page/farm/farm_details_view.dart';

class FarmController extends BaseController {
  //TODO: Implement FarmController
  RxList<FarmDetail> listFarm = <FarmDetail>[].obs;

  Rx<FarmDetail?> selectedFarm = Rx<FarmDetail?>(null);

  TextEditingController namefarmController = TextEditingController(text: '');
  TextEditingController businessModelController =
      TextEditingController(text: '');
  TextEditingController businessTypeController =
      TextEditingController(text: '');
  TextEditingController provinceController = TextEditingController(text: '');
  TextEditingController districtController = TextEditingController(text: '');
  TextEditingController wardsController = TextEditingController(text: '');

  RxList<Product> listBusinessModel = <Product>[].obs;
  RxList<Product> listBusinessType = <Product>[].obs;
  RxList<Product> listprovince = <Product>[].obs;
  RxList<Product> listdistrict = <Product>[].obs;
  RxList<Product> listwards = <Product>[].obs;
  RxList<Product> unit = <Product>[].obs;

  Rx<String> businessModelChoose = "".obs;
  Rx<String> businessTypeChoose = "".obs;
  Rx<String> districtChoose = "".obs;
  Rx<String> provinceChoose = "".obs;
  Rx<String> wardsChoose = "".obs;
  final count = 0.obs;
  final isLoading = true.obs;

  @override
  Future<void> onInit() async {
    await getAllBusinessModel();
    await getAllBusinessType();
    await getAllDistrict();
    await getAllProvince();
    await getAllWards();
    await refeshDataFarm();
    super.onInit();
  }

  getAllBusinessModel() async {
    listBusinessModel.value =
        await FarmApi.getAllDataByTypeCategory("BUSINESS_MODEL");
  }

  getAllBusinessType() async {
    listBusinessType.value =
        await FarmApi.getAllDataByTypeCategory("BUSINESS_TYPE");
  }

  getAllProvince() async {
    listprovince.value = await FarmApi.getAllDataByTypeCategory("TINH_THANH");
  }

  getAllDistrict() async {
    listdistrict.value = await FarmApi.getAllDataByTypeCategory("QUAN_HUYEN");
  }

  getAllWards() async {
    listwards.value = await FarmApi.getAllDataByTypeCategory("PHUONG_XA");
  }

  chooseBusinessModel(String nameBusinessModel) {
    businessModelChoose(nameBusinessModel);
    businessModelController.text = nameBusinessModel;
  }

  choosebusinessType(String namebusinessType) {
    businessTypeChoose(namebusinessType);
    businessTypeController.text = namebusinessType;
  }

  chooseProvince(String nameProvince) {
    provinceChoose(nameProvince);
    provinceController.text = nameProvince;
  }

  chooseDistrict(String nameDistrict) {
    districtChoose(nameDistrict);
    districtController.text = nameDistrict;
  }

  chooseWards(String nameWards) {
    wardsChoose(nameWards);
    wardsController.text = nameWards;
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

  void showFarmDetails(FarmDetail farm) {
    selectedFarm.value = farm;
    Get.to(() => FarmDetailsView(
          idFarm: farm.id,
        ));
  }
  // showData(Farm farm) {
  //   refeshDataFarm();
  //   Get.to(FarmDetailsView(
  //     idFarm: farm.id,
  //   ));
  // }

  void increment() => count.value++;
}
