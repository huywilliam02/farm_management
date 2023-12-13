import 'dart:developer';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/app/core/common/input/common_form_field_widget.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/area/view_more_area/view_more_land_controller.dart';
import 'package:itfsd/app/core/common/input/form_field_widget.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../../controllers/area/more_area/more_land_controller.dart';

class MoreLandView extends BaseView<MoreLandController> {
  const MoreLandView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Get.find<ViewMoreLandController>().refeshData();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: UtilsReponsive.height(context, 30),
              ),
              Row(
                children: [
                  Expanded(
                      child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () async {
                      await Get.find<ViewMoreLandController>().refeshData();
                      Get.back();
                    },
                  )),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        'Thêm khu cach tác',
                        style: GoogleFonts.roboto(
                          // textStyle: Theme.of(context).textTheme.displayLarge,
                          textStyle: TextStyleConstant.black22RobotoBold,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              SizedBox(
                height: UtilsReponsive.height(context, 10),
              ),
              SizedBox(
                height: 250,
                child: Stack(
                  children: [
                    Obx(() {
                      log(controller.listPolygon.length.toString());
                      return FlutterMap(
                        mapController: controller.mapController,
                        options: MapOptions(
                          center: const LatLng(
                              10.877541358205578, 106.8088219685599),
                          zoom: 12,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName:
                                'dev.fleaflet.flutter_map.example',
                          ),
                          MarkerLayer(markers: controller.listMarker.value),
                          PolylineLayer(
                              polylines: controller.listPolyline.value),
                          PolygonLayer(
                            polygons: controller.listPolygon.value,
                          ),
                          PolylineLayer(
                            polylines: controller.listPolyline.toList(),
                          ),
                        ],
                      );
                    }),
                    Positioned(
                      right: 20,
                      top: 200,
                      child: IconButton(
                        onPressed: () async {
                          await Geolocator.requestPermission();
                          await controller.addMarkerGet();
                        },
                        icon: const Icon(
                          Icons.location_history,
                          color: Colors.green,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tên doanh nghiệp",
                      style: GoogleFonts.roboto(
                        // textStyle: Theme.of(context).textTheme.displayLarge,
                        textStyle: TextStyleConstant.grey16RobotoBold,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 400,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.listFarm.value.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                            controller.listFarm[index].name!),
                                        trailing: controller
                                                    .idFarmChoose.value ==
                                                controller.listFarm[index].id!
                                            ? const Icon(
                                                Icons.check,
                                                color: Colors.green,
                                              )
                                            : null,
                                        onTap: () {
                                          controller.changeFarm(
                                              controller.listFarm[index]);
                                          Get.back();
                                        },
                                      ),
                                      const Divider(
                                        thickness: 1.0,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: CommonFormFieldWidget(
                        controllerEditting: controller.farmcontroller,
                        isEnabled: false,
                        setValueFunc: () {},
                      ),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 20),
                    ),
                    Text(
                      "Tên khu canh tác",
                      style: GoogleFonts.roboto(
                        // textStyle: Theme.of(context).textTheme.displayLarge,
                        textStyle: TextStyleConstant.grey16RobotoBold,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Obx(
                      () => CommonFormFieldWidget(
                        controllerEditting: controller.namecontroller,
                        textInputType: TextInputType.text,
                        errorText: controller.validateErrname.value,
                        setValueFunc: controller.setValueName,
                      ),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 20),
                    ),
                    Row(
                      children: [
                        Text(
                          "Diện tích",
                          style: GoogleFonts.roboto(
                            // textStyle: Theme.of(context).textTheme.displayLarge,
                            textStyle: TextStyleConstant.grey16RobotoBold,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        const Text(
                          " *",
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                        Text(
                          " ( đơn vị nhập m² )",
                          style: GoogleFonts.roboto(
                            // textStyle: Theme.of(context).textTheme.displayLarge,
                            textStyle: TextStyleConstant.grey16RobotoBold,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Obx(
                      () => CommonFormFieldWidget(
                        controllerEditting: controller.acreagecontroller,
                        textInputType: TextInputType.number,
                        errorText: controller.validateErracreage.value,
                        setValueFunc: controller.setValueacreage,
                      ),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 20),
                    ),
                    Row(
                      children: [
                        Text(
                          "Điểm",
                          style: GoogleFonts.roboto(
                            // textStyle: Theme.of(context).textTheme.displayLarge,
                            textStyle: TextStyleConstant.grey16RobotoBold,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        const Text(
                          " *",
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                        Text(
                          " ( nhập vị trí )",
                          style: GoogleFonts.roboto(
                            // textStyle: Theme.of(context).textTheme.displayLarge,
                            textStyle: TextStyleConstant.grey16RobotoBold,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              // Expanded(
                              //   child: TextFormField(
                              //     decoration: InputDecoration(
                              //       hintText: 'Latitute',
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(20),
                              //       ),
                              //     ),
                              //     keyboardType: TextInputType.number,
                              //     onChanged: (value) {
                              //       controller.latInput(double.parse(value));
                              //     },
                              //   ),
                              // ),
                              Expanded(
                                  child: CommonFormFieldWidget(
                                textInputType: TextInputType.number,
                                setValueFunc: (value) {
                                  controller.latInput(double.parse(value));
                                },
                              )),
                              SizedBox(
                                width: UtilsReponsive.width(context, 10),
                              ),
                              // Expanded(
                              //   child: TextFormField(
                              //     decoration: InputDecoration(
                              //       hintText: 'Longtitute',
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(20),
                              //       ),
                              //     ),
                              //     keyboardType: TextInputType.number,
                              //     onChanged: (value) {
                              //       controller.lngInput(double.parse(value));
                              //     },
                              //   ),
                              // ),
                              Expanded(
                                  child: CommonFormFieldWidget(
                                textInputType: TextInputType.number,
                                setValueFunc: (value) {
                                  controller.lngInput(double.parse(value));
                                },
                              )),
                              SizedBox(
                                width: UtilsReponsive.width(context, 10),
                              ),

                              IconButton(
                                onPressed: () async {
                                  controller.addMarker(
                                      controller.latInput.value,
                                      controller.lngInput.value);
                                },
                                icon: Image.asset(
                                  "assets/icons/add.png",
                                  height: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => controller.listLatlng.value.isEmpty
                          ? const SizedBox.shrink()
                          : GestureDetector(
                              onTap: () {
                                Get.bottomSheet(Container(
                                    color: Colors.white,
                                    height: UtilsReponsive.height(context, 300),
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            controller.listLatlng.value.length,
                                        itemBuilder: (context, index) =>
                                            ListTile(
                                              onTap: () {
                                                Get.back();
                                                controller.removeLatLng(index);
                                              },
                                              title: Text(
                                                  'Điểm :  ${index + 1} ${controller.listLatlng[index].latitude},${controller.listLatlng[index].longitude}'),
                                              trailing: const Icon(Icons.close),
                                            ))));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20)),
                                height: UtilsReponsive.height(context, 40),
                                width: UtilsReponsive.width(context, 100),
                                child: Center(
                                    child: Text(
                                  '${controller.listLatlng.length} Diem',
                                  style: const TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 20),
                    ),
                    Text(
                      "Ghi chú",
                      style: GoogleFonts.roboto(
                        // textStyle: Theme.of(context).textTheme.displayLarge,
                        textStyle: TextStyleConstant.grey16RobotoBold,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    CommonFormFieldWidget(
                      textInputType: TextInputType.text,
                      setValueFunc: controller.setValuedescription,
                      controllerEditting: controller.descriptioncontroller,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 20),
                    ),
                    Text(
                      "Chọn hình ảnh",
                      style: GoogleFonts.roboto(
                        // textStyle: Theme.of(context).textTheme.displayLarge,
                        textStyle: TextStyleConstant.grey16RobotoBold,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: UtilsReponsive.height(context, 160),
                          width: double.infinity,
                          child: Obx(
                            () => ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: UtilsReponsive.height(context, 10),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.listImage.isNotEmpty
                                  ? controller.listImage.length + 1
                                  : 1,
                              itemBuilder: (context, index) {
                                if (controller.listImage.isNotEmpty) {
                                  if (index == controller.listImage.length) {
                                    return SizedBox(
                                      height:
                                          UtilsReponsive.height(context, 150),
                                      width: UtilsReponsive.width(context, 150),
                                      // decoration: BoxDecoration(
                                      //     // color: Colors.white,
                                      //     // border: Border.all(width: 3),
                                      //     ),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            controller.onImagePick();
                                          },
                                          icon: Image.asset(
                                            "assets/icons/gallery.png",
                                            height: UtilsReponsive.height(
                                                context, 90),
                                            width: UtilsReponsive.width(
                                                context, 50),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return SizedBox(
                                    // color: Colors.grey.shade200,
                                    height: UtilsReponsive.height(context, 150),
                                    width: UtilsReponsive.width(context, 150),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Image.file(
                                            File(controller.listImage[index]),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.white,
                                            child: IconButton(
                                              onPressed: () {
                                                controller
                                                    .onTabDeleteIamge(index);
                                              },
                                              icon: const Icon(Icons.close),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                } else {
                                  return SizedBox(
                                    height: UtilsReponsive.height(context, 150),
                                    width: UtilsReponsive.width(context, 150),
                                    // decoration: const BoxDecoration(
                                    //   color: Colors.white,
                                    // ),
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {
                                          controller.onImagePick();
                                        },
                                        icon: Image.asset(
                                          "assets/icons/gallery.png",
                                          height: UtilsReponsive.height(
                                              context, 90),
                                          width:
                                              UtilsReponsive.width(context, 50),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 20),
                    ),
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: context.width),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          minimumSize:
                              const MaterialStatePropertyAll(Size(20, 50)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 40, 127, 60)),
                          // padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                        ),
                        child: const Text(
                          "Xác nhận",
                          style: TextStyleConstant.white16Roboto,
                        ),
                        onPressed: () async {
                          await controller.newLand();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
