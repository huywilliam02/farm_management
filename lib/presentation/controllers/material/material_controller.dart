import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/material/material_api.dart';
import 'package:itfsd/presentation/page/material/material_view.dart';
import 'package:itfsd/presentation/page/material/more_material.dart';
import 'package:itfsd/data/model/category/product.dart';
import 'package:itfsd/data/model/material/materialdetail.dart';
import 'package:itfsd/data/model/material/materialmodel.dart';

class MaterialController extends BaseController {
  //TODO: Implement MaterialController

  Rx<String> namematerial = "".obs;
  Rx<int> quantity = 0.obs;
  Rx<String> description = "".obs;
  Rx<int> price = 0.obs;
  RxList<String> listImage = <String>[].obs;
  Rx<String> materialGroupId = "".obs;

  TextEditingController namematerialController =
      TextEditingController(text: '');
  TextEditingController quantityController = TextEditingController(text: '');
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController(text: '');
  TextEditingController materialGroupIdController =
      TextEditingController(text: 'Chọn nhóm vật tư');

  RxList<MaterialDetail> listMaterial = <MaterialDetail>[].obs;
  RxList<MaterialDetail> listToView = <MaterialDetail>[].obs;
  RxList<Product> listMaterialid = <Product>[].obs;
  TextEditingController searchController = TextEditingController(text: '');
  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int indexPage = 1;
  ScrollController materialscrollController = ScrollController();
  final count = 0.obs;

  List<String> listStatusDropdown = <String>['Còn hàng', 'Hết hàng'];
  Rx<String> dropdownValue = "".obs;


  @override
  Future<void> onInit() async {
    dropdownValue.value = listStatusDropdown.first;
    try {
      isLoading(true);
      await refeshDataMaterial();
      await getAllMaterialGroup();
  
      isLoading(false);
    } catch (e) {
      Get.back();
      Get.snackbar("Bị lỗi ", e.toString());
      log(e.toString());
    }
    materialscrollController.addListener(_scrollListener);
    super.onInit();
  }



  void _scrollListener() async {
    if (materialscrollController.position.pixels ==
        materialscrollController.position.maxScrollExtent) {
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
        List<MaterialDetail> listTmp =
            await MaterialApi.getAllDataMaterial(indexPage);
        if (listTmp.isEmpty) {
          // Get.snackbar("Thông báo", "Hết dữ liệu");
          noMoreRecord(true);
        } else {
          listMaterial.value.addAll(listTmp);
        }
      }
    } finally {
      lazyLoading(false);
    }
  }

  getAllMaterialGroup() async {
    listMaterialid.value =
        await MaterialApi.getAllDataByTypeCategory("NHOM_VAT_TU");
  }

  chooseMaterial(Product product) {
    log(product.id.toString());
    log(product.name.toString());

    materialGroupId(product.id);
    materialGroupIdController.text = product.name!;
  }

  setValueNameMaterial(String value) {
    print("hehe");
    namematerial.value = value;
  }

  setValueDescription(String value) {
    print("hehe");
    description.value = value;
  }

  refeshDataMaterial() async {
    // try {
    isLoading(true);
    indexPage = 1;
    noMoreRecord(false);
    listMaterial.value = await MaterialApi.getAllDataMaterial(indexPage);
    showAll();
    isLoading(false);
    // } catch (e) {
    //   log('err' + e.toString());
    // }
  }

  showAll() {
    listToView.clear();
    listToView.addAll(listMaterial);
  }

  showData(MaterialDetail model) {
    refeshForm();
    namematerialController.text = model.name;
    quantity(model.quantity);
    descriptionController.text = model.description;
    price(model.price);
    listImage(model.images);
    materialGroupId(model.materialGroup.id);
    materialGroupIdController.text = model.materialGroup.name;
    dropdownValue.value =
        model.status == 1 ? listStatusDropdown.first : listStatusDropdown.last;
    Get.to(() => MoreMaterialView(
          idMaterial: model.id,
        ));
  }

  refeshForm() {
    namematerialController.text = "";
    quantity(0);
    descriptionController.text = '';
    price(0);
    materialGroupId(listMaterialid[0].name);
    listImage([]);
  }

  createMaterial(String? idmaterial) async {
    log(namematerialController.text);
    log(quantity.value.toString());
    log(descriptionController.text);
    log(listImage.toString());
    log(materialGroupIdController.text);
    log("${dropdownValue == listStatusDropdown.first}");

    MaterialModel formData = MaterialModel(
        name: namematerialController.text,
        quantity: quantity.value,
        description: descriptionController.text,
        price: price.value,
        materialGroup: materialGroupId.value,
        status: dropdownValue.value == listStatusDropdown.first);
    bool check = idmaterial != null
        ? await MaterialApi.updataMaterial(formData, listImage, idmaterial)
        : await MaterialApi.createMaterial(formData, listImage);
    if (check) {
      Get.back();
      refeshDataMaterial();
      Get.snackbar('Thông báo', 'Tạo vật tư thành công',
          backgroundColor: Colors.green.withOpacity(0.7),
          colorText: Colors.white);
    } else {
      Get.snackbar('Thông báo', 'Tạo vật tư không thành công',
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    }
  }

  onImagePick() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      final LostDataResponse response2 = await picker.retrieveLostData();
      File file = File(pickedFile.path);
      listImage.add(file.path);
    }
  }

  onTabDeleteIamge(int index) {
    listImage.removeAt(index);
  }

  void increment() => count.value++;

  onTypingSearch(String value) async {
    if (value.isNotEmpty) {
//search
      noMoreRecord(true);
      listMaterial.value = await MaterialApi.searchMaterial(value);
    } else {
      refeshDataMaterial();
    }
  }

  deleteDataRequestForm(String idMaterial) async {
    try {
      bool check = await MaterialApi.deleteMaterial(idMaterial);
      if (check) {
        //thông báo true
        refeshDataMaterial();
        Get.to(() => const MaterialView());
        Get.snackbar('Thông báo', 'Xóa vật tư thành công',
            backgroundColor: Colors.green.withOpacity(0.7),
            colorText: Colors.white);
      } else {
        Get.snackbar('Thông báo', 'Xóa vật tư không thành công',
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    } catch (e) {
      Get.back();
      Get.snackbar("Lỗi", "Có gì đó không đúng");
    }
  }
}
