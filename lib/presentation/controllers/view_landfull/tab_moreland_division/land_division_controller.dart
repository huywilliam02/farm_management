import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/view_landfull/land_division.dart';
import 'package:itfsd/data/network/api/view_area/more_land.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itfsd/data/model/category/product.dart';
import 'package:itfsd/data/model/land/land.dart';
import 'package:itfsd/data/model/area/moreLand.dart';
import 'package:latlong2/latlong.dart';

class LandDivisionController extends BaseController {
  final count = 0.obs;

  RxDouble lat = 0.0.obs;
  RxDouble lng = 0.0.obs;
  RxDouble latInput = 0.0.obs;
  RxDouble lngInput = 0.0.obs;
  RxList<Marker> listMarker = <Marker>[].obs;
  RxList<Polyline> listPolyline = <Polyline>[].obs;
  RxList<LatLng> listLatlng = <LatLng>[].obs;
  late StreamSubscription<Position> positionStreamOnApp;
  late Position postion;
  RxList<Polygon> listPolygon = <Polygon>[].obs;
  RxList<Polyline> listPolylinePhanVung = <Polyline>[].obs;
  MapController mapController = MapController();
  RxList<String> listImage = <String>[].obs;

  RxList<MorelandModel> listArea = <MorelandModel>[].obs;
  RxBool isLoading = true.obs;
  Rx<String> name = "".obs;
  Rx<String> idAreaChoose = "".obs;
  Rx<String> idproductnameChoose = "".obs;
  Rx<String> idSoildChoose = "".obs;
  Rx<String> colorProduct = "".obs;

  TextEditingController areaController =
      TextEditingController(text: 'Mời chọn khu canh tác');
  // Rx<String> soiltypeId = "".obs;
  TextEditingController soilTypeIdController =
      TextEditingController(text: 'Mời chọn loại đất');
  TextEditingController productController =
      TextEditingController(text: 'Mời chọn loại sản phẩm');
  RxList<Product> listSoild = <Product>[].obs;
  RxList<Product> listProduct = <Product>[].obs;
  Rx<int> acreage = 0.obs;
  ProductType? productType;
  @override
  Future<void> onInit() async {
    try {
      isLoading(true);
      mapController = MapController();
      await Geolocator.requestPermission();
      positionStreamOnApp =
          Geolocator.getPositionStream().listen((Position locationData) {
        postion = locationData;
        lat(locationData.latitude);
        lng(locationData.longitude);
      });
      await getAllArea();
      await getAllSolidType();
      await getAllProduct();
      isLoading(false);
    } catch (e) {
      Get.back();
      Get.snackbar("SomeThingWrong", e.toString());
    }
    super.onInit();
  }



  setValueName(String value) {
    name.value = value;
  }

// thêm makker
  addMarker(double lat, double lng) {
    listLatlng.add(LatLng(lat, lng));
    listMarker.add(Marker(
        width: 80,
        height: 80,
        point: LatLng(lat, lng),
        builder: (ctx) => const Icon(Icons.location_on)));
    moveToLastMarker();
    renderLatlng();
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

  moveToLand(LatLng point) {
    mapController.move(point, 15.0);
  }

// render lat lng
  renderLatlng() {
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

  renderLatlngArea(MorelandModel model) {
    listPolyline.clear();
    if (model.locations.length > 2) {
      for (var i = 0; i < model.locations.length - 1; i++) {
        listPolyline.add(
          Polyline(
            points: [
              LatLng(model.locations[i].latitude, model.locations[i].longitude),
              LatLng(model.locations[i + 1].latitude,
                  model.locations[i + 1].longitude)
            ],
            color: Colors.blue,
            strokeWidth: 4.0,
          ),
        );
      }
      listPolyline.add(Polyline(
        points: [
          LatLng(model.locations.last.latitude, model.locations.last.longitude),
          LatLng(
              model.locations.first.latitude, model.locations.first.longitude)
        ],
        color: Colors.blue,
        strokeWidth: 4.0,
      ));
    }
  }

// Thêm khu đất mới
  newLand() {
    listPolyline.clear();
    listMarker.clear();
    listLatlng.clear();
    update();
  }
// hiện thị khu đất

  removeLatLng(int index) {
    listMarker.removeAt(index);
    listLatlng.removeAt(index);
    moveToLastMarker();
    renderLatlng();
  }

// thêm vùng đất
  newRegionLand() async {
    log(listLatlng.length.toString());
    if (listLatlng.length < 3) {
      Get.snackbar('SOMETHINGWRONG', 'AT LEAST 3 POINT');
    } else {
      List<LatLng> listLatLngAdd = [];
      for (var element in listLatlng) {
        listLatLngAdd.add(element);
      }
      List<Location> locations = [];
      for (var i = 0; i < listLatlng.length; i++) {
        locations.add(Location(
            point: i + 1,
            latitude: listLatlng[i].latitude,
            longitude: listLatlng[i].longitude));
      }
      LandDivision model = LandDivision(
        id: "",
        area: Area(id: idAreaChoose.value),
        // idArea: idAreaChoose.value,
        name: name.value,
        acreage: acreage.value,
        productType: ProductType(id: idproductnameChoose.value),
        solidTypeId: idSoildChoose.value,
        locations: locations,
      );
      try {
        bool check = await LanddivisionApi.createNewLandDevision(
            model, listImage); // mới thêm
        log(model.toJson().toString());
        log(idAreaChoose.toString());
        if (check) {
          Get.snackbar('Thông báo', 'Chia vùng thành công');
          listPolygon.value.add(Polygon(
            isFilled: true,
            points: listLatLngAdd,
            color: parseRGBStringToColor(colorProduct.value),
            borderStrokeWidth: 3,
            borderColor: Colors.black,
          ));
          listLatlng.clear();
          listPolylinePhanVung.clear();
          listMarker.clear();
          update();
        } else {
          Get.snackbar('Thong bao', 'Chia Vung That Bai');
        }
      } catch (e) {
        log(e.toString());
        Get.snackbar('SOMETHINGWRONG', e.toString());
      }
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

  getAllSolidType() async {
    listSoild.value =
        await LanddivisionApi.getAllDataByTypeCategory("SOIL_TYPE");
  }

  getAllProduct() async {
    listProduct.value =
        await LanddivisionApi.getAllDataByTypeCategory("PRODUCT_TYPE");
  }

  getAllArea() async {
    listArea.value = await MoreLandApi.getAllArea();
  }

  chooseArea(MorelandModel model) {
    idAreaChoose(model.id);
    areaController.text = model.name;
    moveToLand(
        LatLng(model.locations[0].latitude, model.locations[0].longitude));
    renderLatlngArea(model);
  }

  chooseSoiltype(Product soiltype) {
    idSoildChoose(soiltype.id);
    soilTypeIdController.text = soiltype.name!;
  }

  chooseProduct(Product product) {
    idproductnameChoose(product.id);
    productController.text = product.name!;
    colorProduct.value = product.childColumn!.color!;
  }

  onTabDeleteIamge(int index) {
    listImage.removeAt(index);
  }

  Color parseRGBStringToColor(String rgbString) {
    // Remove any leading/trailing spaces and the "rgb(" and ")" parts
    String cleanRGBString =
        rgbString.trim().replaceAll("rgb(", "").replaceAll(")", "");

    // Split the RGB values into a list of strings
    List<String> rgbValues = cleanRGBString.split(',');

    // Parse the RGB values to integers
    int red = int.parse(rgbValues[0].trim());
    int green = int.parse(rgbValues[1].trim());
    int blue = int.parse(rgbValues[2].trim());

    // Create and return the Color object
    return Color.fromARGB(255, red, green, blue);
  }
}
