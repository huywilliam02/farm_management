import 'dart:io';

import 'package:itfsd/app/core/common/input/common_form_field_widget.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/core/common/input/form_field_widget.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../controllers/view_landfull/tab_moreland_division/land_division_controller.dart';

class LandDivisionView extends BaseView<LandDivisionController> {
  const LandDivisionView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Thêm vùng canh tác",
        titleType: AppBarTitle.text,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        centerTitle: true,
        leadingIcon: const Icon(Icons.arrow_back_ios_new),
        onLeadingPressed: () {
          Get.back();
        },
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const CommonLoadingPageProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    SizedBox(
                      height: 250,
                      child: Stack(
                        children: [
                          Obx(() {
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
                                MarkerLayer(
                                    markers: controller.listMarker.value),
                                PolylineLayer(
                                    polylines: controller.listPolyline.value +
                                        controller.listPolylinePhanVung.value),
                                PolylineLayer(
                                  polylines: controller.listPolyline.toList(),
                                ),
                                PolygonLayer(
                                  polygons: controller.listPolygon.value,
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
                            "Chọn khu canh tác",
                            style: AppTextStyle.textTitleForm,
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    // color: Colors.white,
                                    height: UtilsReponsive.height(context, 300),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: UtilsReponsive.height(
                                                context, 10),
                                          ),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: controller
                                                .listArea.value.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  ListTile(
                                                    title: Text(controller
                                                        .listArea[index].name),
                                                    trailing: controller
                                                                .idAreaChoose
                                                                .value ==
                                                            controller
                                                                .listArea[index]
                                                                .id
                                                        ? const Icon(
                                                            Icons.check,
                                                            color: Colors.green,
                                                          )
                                                        : null,
                                                    onTap: () {
                                                      controller.chooseArea(
                                                          controller
                                                              .listArea[index]);
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
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: CommonFormFieldWidget(
                              controllerEditting: controller.areaController,
                              isEnabled: false,
                              setValueFunc: () {},
                            ),
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          Text(
                            "Tên vùng",
                            style: AppTextStyle.textTitleForm,
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          CommonFormFieldWidget(
                            setValueFunc: controller.setValueName,
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          Text(
                            "Loại sản phẩm",
                            style: AppTextStyle.textTitleForm,
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          Obx(() {
                            controller.idproductnameChoose.value;
                            return viewChooseProduct(context);
                          }),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          Row(
                            children: [
                              Text(
                                "Diện tích",
                                style: AppTextStyle.textTitleForm,
                              ),
                              const Text(
                                " *",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20),
                              ),
                              Text(
                                " ( đơn vị nhập m² )",
                                style: AppTextStyle.textTitleForm,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          CommonFormFieldWidget(
                              initValue: controller.acreage.toString(),
                              textInputType: TextInputType.number,
                              setValueFunc: (value) {
                                controller.acreage.value =
                                    int.tryParse(value) ?? 0;
                              }),
                          Row(
                            children: [
                              Text(
                                "Loại đất",
                                style: AppTextStyle.textTitleForm,
                              ),
                              const Text(
                                " *",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    height: UtilsReponsive.height(context, 300),
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Expanded(
                                          child: ListView.separated(
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) =>
                                                  Column(
                                                    children: [
                                                      ListTile(
                                                        trailing: controller
                                                                    .listSoild
                                                                    .value[
                                                                        index]
                                                                    .id! ==
                                                                controller
                                                                    .idSoildChoose
                                                                    .value
                                                            ? const Icon(
                                                                Icons.check)
                                                            : null,
                                                        onTap: () {
                                                          controller.chooseSoiltype(
                                                              controller
                                                                      .listSoild
                                                                      .value[
                                                                  index]);
                                                          Get.back();
                                                        },
                                                        title: Text(controller
                                                            .listSoild
                                                            .value[index]
                                                            .name!),
                                                      ),
                                                      const Divider(
                                                        thickness: 1.0,
                                                      ),
                                                    ],
                                                  ),
                                              separatorBuilder:
                                                  (context, index) =>
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                              itemCount: controller
                                                  .listSoild.value.length),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: CommonFormFieldWidget(
                              controllerEditting:
                                  controller.soilTypeIdController,
                              isEnabled: false,
                              setValueFunc: () {},
                            ),
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          Row(
                            children: [
                              Text(
                                "Điểm",
                                style: AppTextStyle.textTitleForm,
                              ),
                              const Text(
                                " *",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20),
                              ),
                              Text(
                                " ( nhập vị trí )",
                                style: AppTextStyle.textTitleForm,
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
                                    Expanded(
                                        child: CommonFormFieldWidget(
                                      textInputType: TextInputType.number,
                                      setValueFunc: (value) {
                                        controller
                                            .latInput(double.parse(value));
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
                                        controller
                                            .lngInput(double.parse(value));
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
                          Obx(() => controller.listLatlng.value.isEmpty
                              ? const SizedBox.shrink()
                              : GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(Container(
                                        color: Colors.white,
                                        height:
                                            UtilsReponsive.height(context, 300),
                                        child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: controller
                                                .listLatlng.value.length,
                                            itemBuilder: (context, index) =>
                                                ListTile(
                                                  onTap: () {
                                                    Get.back();
                                                    controller
                                                        .removeLatLng(index);
                                                  },
                                                  title: Text(
                                                      'Điểm ${index + 1} ${controller.listLatlng[index].latitude},${controller.listLatlng[index].longitude}'),
                                                  trailing:
                                                      const Icon(Icons.close),
                                                ))));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: UtilsReponsive.height(context, 40),
                                    width: UtilsReponsive.width(context, 100),
                                    child: Center(
                                        child: Text(
                                      '${controller.listLatlng.length} Diem',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )),
                                  ),
                                )),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          Text(
                            "Chọn hình ảnh",
                            style: AppTextStyle.textTitleForm,
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
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
                                      return const SizedBox(
                                        width: 10,
                                      );
                                    },
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.listImage.isNotEmpty
                                        ? controller.listImage.length + 1
                                        : 1,
                                    itemBuilder: (context, index) {
                                      if (controller.listImage.isNotEmpty) {
                                        if (index ==
                                            controller.listImage.length) {
                                          return SizedBox(
                                            height: UtilsReponsive.height(
                                                context, 150),
                                            width: UtilsReponsive.width(
                                                context, 150),
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
                                                  height: 90,
                                                  width: 50,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        return SizedBox(
                                          // color: Colors.grey.shade200,
                                          height: UtilsReponsive.height(
                                              context, 150),
                                          width: UtilsReponsive.width(
                                              context, 150),
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Image.file(
                                                  File(controller
                                                      .listImage[index]),
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
                                                          .onTabDeleteIamge(
                                                              index);
                                                    },
                                                    icon:
                                                        const Icon(Icons.close),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      } else {
                                        return SizedBox(
                                          height: UtilsReponsive.height(
                                              context, 150),
                                          width: UtilsReponsive.width(
                                              context, 150),
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
                                                height: 90,
                                                width: 50,
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
                                minimumSize: const MaterialStatePropertyAll(
                                    Size(20, 50)),
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
                                await controller.newRegionLand();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  GestureDetector viewChooseProduct(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          builder: (context) {
            return SizedBox(
              height: UtilsReponsive.height(context, 300),
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Column(
                              children: [
                                ListTile(
                                  trailing: controller
                                              .listProduct.value[index].id! ==
                                          controller.idproductnameChoose.value
                                      ? const Icon(Icons.check)
                                      : null,
                                  onTap: () {
                                    controller.chooseProduct(
                                        controller.listProduct.value[index]);
                                    Get.back();
                                  },
                                  title: Text(controller
                                      .listProduct.value[index].name!),
                                ),
                                const Divider(
                                  thickness: 1.0,
                                ),
                              ],
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: controller.listProduct.value.length),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: CommonFormFieldWidget(
          isEnabled: false,
          suffixIcon: const Icon(Icons.arrow_drop_down),
          controllerEditting: controller.productController,
          setValueFunc: () {}),
    );
  }
}
