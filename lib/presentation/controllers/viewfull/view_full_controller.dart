import 'dart:developer';

import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/network/api/view_landfull/land_division.dart';
import 'package:itfsd/data/network/api/view_area/more_land.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:itfsd/data/model/category/product.dart';
import 'package:itfsd/data/model/farm/farm.dart';
import 'package:itfsd/data/model/land/land.dart';
import 'package:itfsd/data/model/area/moreLand.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';
import 'package:latlong2/latlong.dart';

class ViewFullController extends BaseController {
  //TODO: Implement ViewFullController

  final count = 0.obs;
  MapController mapController = MapController();

  RxList<Polygon> listPolygon = <Polygon>[].obs;
  RxList<Polyline> listPolyline = <Polyline>[].obs;
  RxList<Marker> listMarker = <Marker>[].obs;

  RxList<MorelandModel> listArea = <MorelandModel>[].obs;
  RxList<LandDivision> listLand = <LandDivision>[].obs;
  RxList<Farm> listFarm = <Farm>[].obs;
  RxList<Product> listProduct = <Product>[].obs;
  @override
  Future<void> onInit() async {
    try {
      await getAllFarm();
      await getAllArea();
      await getAllLand();
      await getAllProduct();
      renderArea();
      renderLand();
      renderFarm();
    } catch (e) {
      Get.back();
      Get.snackbar("SomeThingWrong", e.toString());
      log(e.toString());
    }
    super.onInit();
  }



  getAllFarm() async {
    listFarm.value = await MoreLandApi.getAllFarm();
  }

  getAllArea() async {
    listArea.value = await MoreLandApi.getAllArea();
  }

  getAllLand() async {
    listLand.value = await LanddivisionApi.getAllLand();
  }

  getAllProduct() async {
    listProduct.value =
        await LanddivisionApi.getAllDataByTypeCategory("PRODUCT_TYPE");
  }

  renderArea() {
    listPolyline.clear();
    for (var element in listArea) {
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
    return Color.fromARGB(155, red, green, blue);
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



// google.navigation:q=${widget.to?.latitude},${widget.to?.longitude}
//  comgooglemapsurl: maps.google.com/?q=@${widget.to?.latitude},${widget.to?.longitude}&zoom=18
  renderFarm() {
    for (var element in listFarm) {
        log("hello");
        listMarker.add(
          Marker(
            width: 80,
            height: 80,
            point:
                LatLng(element.location!.latitude, element.location!.longitude),
            builder: (ctx) => GestureDetector(
              onTap: () {
                Get.bottomSheet(SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    height: 1000,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.VIEW_AREA);
                              },
                              child: const Text("Xem khu canh tác"),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.VIEW_LAND);
                              },
                              child: const Text("Xem vùng canh tác"),
                            ),
                          ],
                        ),
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  HttpNetWorkUrlApi.baseURL + element.image!,
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Doanh nghiệp",
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: 'Roboto'),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Mô hình kinh doanh',
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: 'Roboto'),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Loại hình kinh doanh',
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: 'Roboto'),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    element.name!,
                                    style: const TextStyle(
                                        fontSize: 16, fontFamily: 'Roboto'),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    element.businessModel!,
                                    style: const TextStyle(
                                        fontSize: 16, fontFamily: 'Roboto'),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    element.businessType!,
                                    style: const TextStyle(
                                        fontSize: 16, fontFamily: 'Roboto'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                element.address!,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontFamily: 'Roboto'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
              },
              child: const Image(
                height: 10,
                width: 10,
                image: AssetImage(
                  "assets/icons/location.png",
                ),
              ),
            ),
          ),
        );
      }
  }

  void increment() => count.value++;
}