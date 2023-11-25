import 'dart:developer';

import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/view_landfull/land_division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:itfsd/data/model/land/land.dart';
import 'package:latlong2/latlong.dart';

class ViewLandfullController extends BaseController {
  final count = 0.obs;
  RxList<LandDivision> listLand = <LandDivision>[].obs;
  RxList<LandDivision> listToView = <LandDivision>[].obs;
  RxList<Polygon> listPolygon = <Polygon>[].obs;
  Rx<String> idLandChoose = "".obs;
  MapController mapController = MapController();
  final isLoading = true.obs;
  @override
  Future<void> onInit() async {
    await refeshData();
    super.onInit();
  }



  refeshData() async {
    try {
      isLoading(true);
      listLand.value = await LanddivisionApi.getAllLand();
      showAll();
      log(listPolygon.length.toString());
      isLoading(false);
    } catch (e) {
      log('err$e');
    }
  }

  changeStatus(LandDivision index) {
    log(index.toString());
    if (listToView.contains(index)) {
      listToView.remove(index);
    } else {
      listToView.add(index);
    }
    renderLand();
  }

  showAll() {
    listToView.clear();
    listToView.addAll(listLand);
    renderLand();
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
    return Color.fromARGB(145, red, green, blue);
  }

  renderLand() {
    listPolygon.clear();

    for (var landModel in listLand.value) {
      List<LatLng> listLatLngTmp = [];
      for (var location in landModel.locations!) {
        listLatLngTmp.add(LatLng(location.latitude, location.longitude));
      }
      listPolygon.add(Polygon(
          borderColor:
              parseRGBStringToColor(landModel.productType!.childColumn!.color!),
          isFilled: true,
          color:
              parseRGBStringToColor(landModel.productType!.childColumn!.color!),
          borderStrokeWidth: 3,
          points: listLatLngTmp));
    }
  }

  moveToLand(LatLng point) {
    mapController.move(point, 15.0);
  }
}
