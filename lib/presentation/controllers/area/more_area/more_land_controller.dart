import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/view_area/more_land.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itfsd/data/model/farm/farm.dart';
import 'package:itfsd/data/model/area/moreLand.dart';
import 'package:latlong2/latlong.dart';


class MoreLandController extends BaseController {
  Rx<bool> isLoading = true.obs;
  Rx<bool> isEnable = false.obs;
  //List
  RxList<Marker> listMarker = <Marker>[].obs;
  RxList<Polyline> listPolyline = <Polyline>[].obs;
  RxList<LatLng> listLatlng = <LatLng>[].obs;
//
  late StreamSubscription<Position> positionStreamOnApp;
  late Position postion;
  RxList<MorelandModel> listDat = <MorelandModel>[].obs;
  // late MorelandModel datClass = MorelandModel(
  //   listLatlng: [],
  // );

  Rx<bool> taoDatCheck = false.obs;
  RxList<Polygon> listPolygon = <Polygon>[].obs;
  Rx<bool> phanDatCheck = false.obs;
  RxList<Polyline> listPolylinePhanVung = <Polyline>[].obs;
  MapController mapController = MapController();

// thêm khu đất
  Rx<String> name = "".obs; //tên khu đất
  Rx<String> area = "".obs;
  Rx<double> acreage = 0.0.obs; //diện tích
  Rx<String> description = "".obs; // ghi chú
  //GPS
  RxDouble lat = 0.0.obs;
  RxDouble lng = 0.0.obs;
  // Nhập lat long
  RxDouble latInput = 0.0.obs;
  RxDouble lngInput = 0.0.obs;

  Rx<String> validateErrname = "".obs;
  Rx<String> validateErrarea = "".obs;
  Rx<String> validateErracreage = "".obs;
  // text nhập
  TextEditingController namecontroller = TextEditingController(text: '');
  TextEditingController areacontroller = TextEditingController(text: '');
  TextEditingController acreagecontroller = TextEditingController(text: '');
  TextEditingController descriptioncontroller = TextEditingController(text: '');
  TextEditingController farmcontroller =
      TextEditingController(text: 'Mời chọn doanh nghiệp');

  // bắt lỗi nhập

  late Rx<MorelandModel> morelandModel;
  String accessToken = "";

  //ảnh
  RxList<String> listImage = <String>[].obs;

  RxList<Farm> listFarm = <Farm>[].obs;
  Rx<String> idFarmChoose = ''.obs;

  @override
  void onInit() async {
    mapController = MapController();
    await Geolocator.requestPermission();
    positionStreamOnApp =
        Geolocator.getPositionStream().listen((Position locationData) {
      postion = locationData;
      lat(locationData.latitude);
      lng(locationData.longitude);
    });
    listFarm.value = await MoreLandApi.getAllFarm();
    super.onInit();
  }



  removeLatLng(int index) {
    listMarker.removeAt(index);
    listLatlng.removeAt(index);
    moveToLastMarker();
    renderLatlng();
  }

  changeFarm(Farm farm) {
    idFarmChoose(farm.id);
    farmcontroller.text = farm.name!;
  }

  //bắt nhập
  setValueName(String value) {
    print("hehe");
    name.value = value;
  }

  validateUserName(String value) {
    if (value == "") {
      validateErrname.value = "Vui lòng nhập tên khu đất";
    } else {
      validateErrname.value = "";
    }
  }

  setValueArea(String value) {
    print("hehe");
    area.value = value;
  }

  validateArea(String value) {
    if (value == "") {
      validateErrarea.value = "Vui lòng nhập tên khu đất";
    } else {
      validateErrarea.value = "";
    }
  }

  setValueacreage(String value) {
    acreage.value = double.tryParse(value) ?? 0.0;
  }

  validateacreage(String value) {
    if (value == "") {
      validateErracreage.value = "Vui lòng nhập diện tích";
    } else {
      validateErracreage.value = "";
    }
  }

  setValuedescription(String value) {
    print("I love chụt chụt");
    description.value = value;
  }

// thêm makker
  addMarker(double lat, double lng) {
    if (phanDatCheck.isFalse) {
      // datClass.listLatlng?.add([lat, lng]);
      listLatlng.add(LatLng(lat, lng));
      listMarker.add(Marker(
          width: 80,
          height: 80,
          point: LatLng(lat, lng),
          builder: (ctx) => const Icon(Icons.location_on)));
      renderLatlng();
      moveToLastMarker();
      update();
    } else {
      listLatlng.add(LatLng(lat, lng));
      listMarker.add(Marker(
          width: 80,
          height: 80,
          point: LatLng(lat, lng),
          builder: (ctx) => const Icon(Icons.location_on)));
      renderLatlng();
    }
  }

  // thêm một marker khởi tạo
  addMarkerGet() async {
    addMarker(postion.latitude, postion.longitude);
  }

//di chuyển đến vị trí mình thêm
  moveToLastMarker() {
    if (listMarker.isNotEmpty) {
      var lastMarker = listMarker.last;
      mapController.move(lastMarker.point, 15.0);
    }
  }

// render lat lng
  renderLatlng() {
    log("renderLatlng$phanDatCheck");
    if (phanDatCheck.isFalse) {
      listPolyline.clear();
      if (listLatlng.length > 2) {
        for (var i = 0; i < listLatlng.length - 1; i++) {
          listPolyline.add(
            Polyline(
              points: [listLatlng[i], listLatlng[i + 1]],
              color: Colors.blue,
              strokeWidth: 4.0,
            ),
          );
        }
      }
      listPolyline.add(Polyline(
        points: [listLatlng.last, listLatlng.first],
        color: Colors.blue,
        strokeWidth: 4.0,
      ));
    } else {
      listPolylinePhanVung.clear();
      if (listLatlng.length > 2) {
        for (var i = 0; i < listLatlng.length - 1; i++) {
          listPolylinePhanVung.add(
            Polyline(
              points: [listLatlng[i], listLatlng[i + 1]],
              color: Colors.blue,
              strokeWidth: 4.0,
            ),
          );
        }
      }
      listPolylinePhanVung.add(Polyline(
        points: [listLatlng.last, listLatlng.first],
        color: Colors.blue,
        strokeWidth: 4.0,
      ));
      update();
    }
  }

// Thêm khu đất mới
  newLand() async {
    // listDat.add(datClass);
    // datClass = MorelandModel(
    //   listLatlng: [],
    // );
    if (listLatlng.length < 3) {
      Get.snackbar('Thong bao', 'At least 3 point');
    } else {
      List<Location> locations = [];
      for (var i = 0; i < listLatlng.length; i++) {
        locations.add(Location(
            point: i + 1,
            latitude: listLatlng[i].latitude,
            longitude: listLatlng[i].longitude));
      }

      MorelandModel model = MorelandModel(
          id: "",
          name: name.value,
          description: description.value,
          locations: locations,
          acreage: acreage.value);
      model.farmId = idFarmChoose.value;
      log(model.toJson().toString());

      bool check = await MoreLandApi.createNewLand(model, listImage);
      if (check) {
        log('Tao dat thanh cong');
        Get.snackbar('Thông báo', 'Tạo đất thành công');
        listImage.clear();
        listLatlng.clear();
        listPolyline.clear();
        listMarker.clear();
        namecontroller.text = '';
        areacontroller.text = '';
        acreagecontroller.text = '';
        descriptioncontroller.text = '';
        farmcontroller.text = 'Mời chọn nông trại';
      } else {
        log('Tao dat fail');
      }
    }
    update();
  }
// hiện thị khu đất

  showLand(int index) {
    listPolyline.clear();
    List<LatLng> listLatlng = [];
    for (var i = 0; i < listLatlng.length - 1; i++) {
      listPolyline.add(
        Polyline(
          points: [listLatlng[i], listLatlng[i + 1]],
          color: Colors.blue,
          strokeWidth: 4.0,
        ),
      );
    }
    listPolyline.add(Polyline(
      points: [listLatlng.last, listLatlng.first],
      color: Colors.blue,
      strokeWidth: 4.0,
    ));
  }

// thêm vùng đất
  newRegionLand(int indexColor) {
    Color colorDefault = Colors.red;
    switch (indexColor) {
      case 1:
        colorDefault = Colors.blue;
        break;
      default:
        Colors.red;
    }
    log(listPolyline.length.toString());
    List<LatLng> listLatLngAdd = [];
    for (var element in listLatlng) {
      listLatLngAdd.add(element);
    }
    listPolygon.value.add(Polygon(
      isFilled: true,
      points: listLatLngAdd,
      color: colorDefault.withOpacity(0.5),
      borderStrokeWidth: 3,
      borderColor: Colors.black,
    ));
    listLatlng.clear();
    listPolylinePhanVung.clear();
    listMarker.clear();
    update();
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

  showLoading({String title = "Loading..."}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  onClickCancel() {
    isEnable(false);
    Get.back();
  }

  onTabDeleteIamge(int index) {
    listImage.removeAt(index);
  }

  onClickCreateMoreLand() {
    log(listPolyline.toString());
  }
}
