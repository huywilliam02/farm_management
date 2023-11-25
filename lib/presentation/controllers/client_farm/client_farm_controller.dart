import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/client_farm/client_api.dart';
import 'package:itfsd/presentation/page/client_farm/client_farm_view.dart';
import 'package:itfsd/presentation/page/client_farm/more_client.dart';
import 'package:itfsd/data/model/client_farm/client_detail.dart';
import 'package:itfsd/data/model/client_farm/client_model.dart';

class ClientFarmController extends BaseController {
//TODO: Implement SupplierController

  Rx<String> nameClient = "".obs;
  Rx<String> addresss = "".obs;
  Rx<int> debt = 0.obs;
  Rx<String> phonenumber = "".obs;
  Rx<String> description = "".obs;

  TextEditingController nameClientController = TextEditingController();
  TextEditingController addresssController = TextEditingController();
  TextEditingController debtController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  RxList<ClientDetail> listClient = <ClientDetail>[].obs;
  RxList<ClientDetail> listToView = <ClientDetail>[].obs;

  TextEditingController searchController = TextEditingController(text: '');
  RxBool isLoading = true.obs;
  RxBool lazyLoading = false.obs;
  RxBool noMoreRecord = false.obs;
  int indexPage = 1;
  ScrollController clientFarmscrollController = ScrollController();

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
    clientFarmscrollController.addListener(_scrollListener);
    super.onInit();
  }

  void _scrollListener() async {
    if (clientFarmscrollController.position.pixels ==
        clientFarmscrollController.position.maxScrollExtent) {
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
        List<ClientDetail> listTmp =
            await ClientApi.getAllDataClient(indexPage);
        if (listTmp.isEmpty) {
          // Get.snackbar("Thông báo", "Hết dữ liệu");
          noMoreRecord(true);
        } else {
          listClient.value.addAll(listTmp);
        }
      }
    } finally {
      lazyLoading(false);
    }
  }

  setValueName(String value) {
    print("hehe");
    nameClient.value = value;
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
    isLoading(true);
    indexPage = 1;
    noMoreRecord(false);
    listClient.value = await ClientApi.getAllDataClient(indexPage);
    showAll();
    isLoading(false);
  }

  showAll() {
    listToView.clear();
    listToView.addAll(listClient);
  }

  refeshForm() {
    nameClientController.text = "";
    addresssController.text = "";
    debt(0);
    phonenumberController.text = "";
    descriptionController.text = "";
  }

  showData(ClientDetail clientid) {
    refeshForm();
    nameClientController.text = clientid.name;
    addresssController.text = clientid.address;
    debt(clientid.debt);
    phonenumberController.text = clientid.phoneNumber;
    descriptionController.text = clientid.description;
    Get.to(
      () => MoreClientView(
        idClient: clientid.id,
      ),
    );
  }

  createClient(String? idClient) async {
    log(nameClientController.text);
    log(addresssController.text);
    log(debt.value.toString());
    log(phonenumberController.text);
    log(descriptionController.text);
    ClientModel formData = ClientModel(
      // name: namesupplier.value,
      // address: addresss.value,
      name: nameClientController.text,
      address: addresssController.text,
      debt: debt.value,
      phoneNumber: phonenumberController.text,
      description: descriptionController.text,
    );
    // bool check = await SupplierApi.createSupplier(formData);
    bool check = idClient != null
        ? await ClientApi.updateClient(idClient, formData)
        : await ClientApi.createClient(formData);
    if (check) {
      Get.back();
      refeshData();
      Get.snackbar('Thông báo', 'Tạo khách hàng thành công',
          backgroundColor: Colors.green.withOpacity(0.7),
          colorText: Colors.white);
    } else {
      Get.snackbar('Thông báo', 'Tạo khách hàng không thành công',
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
        Get.to(() => const ClientFarmView());
        Get.snackbar('Thông báo', 'Xóa khách hàng thành công',
            backgroundColor: Colors.green.withOpacity(0.7),
            colorText: Colors.white);
      } else {
        Get.snackbar('Thông báo', 'Xóa khách hàng không thành công',
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    } catch (e) {
      Get.back();
      Get.snackbar("Lỗi", "Có gì đó không đúng");
    }
  }

  onTypingSearchClient(String value) async {
    if (value.isNotEmpty) {
//search
      noMoreRecord(true);
      listClient.value = await ClientApi.searchClient(value);
    } else {
      refeshData();
    }
  }

  void increment() => count.value++;
}
