import 'dart:developer';

import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/view_area/more_land.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:itfsd/data/model/land/land.dart';
import 'package:itfsd/data/model/area/moreLand.dart';
import 'package:latlong2/latlong.dart';

class ViewMoreLandController extends BaseController {
  //TODO: Implement ViewMoreLandController

  final count = 0.obs;
  RxList<MorelandModel> listArea = <MorelandModel>[].obs;
  RxList<MorelandModel> listToView = <MorelandModel>[].obs;

  RxList<LandDivision> listLand = <LandDivision>[].obs;
  RxList<Polyline> listPolyline = <Polyline>[].obs;
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
      showAll();

      isLoading(false);
    } catch (e) {
      log('err$e');
    }
  }


  changeStatus(MorelandModel index) {
    log(index.toString());
    if (listToView.contains(index)) {
      listToView.remove(index);
    } else {
      listToView.add(index);
    }
    renderArea();
  }

  showAll() {
    listToView.clear();
    listToView.addAll(listArea);
    renderArea();
  }

  renderArea() {
    log('s${listToView.length}');
    listPolyline.clear();
    for (var element in listToView) {
      if (element.locations.length > 2) {
        for (var i = 0; i < element.locations.length - 1; i++) {
          listPolyline.add(
            Polyline(
              points: [
                LatLng(element.locations[i].latitude,
                    element.locations[i].longitude),
                LatLng(element.locations[i + 1].latitude,
                    element.locations[i + 1].longitude)
              ],
              color: Colors.blue,
              strokeWidth: 4.0,
            ),
          );
        }
        listPolyline.add(Polyline(
          points: [
            LatLng(element.locations.last.latitude,
                element.locations.last.longitude),
            LatLng(element.locations.first.latitude,
                element.locations.first.longitude)
          ],
          color: Colors.blue,
          strokeWidth: 4.0,
        ));
      }
    }
  }
}
