import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/constants/app_constants.dart';
import 'package:latlong2/latlong.dart';

import '../../../controllers/area/view_more_area/view_more_land_controller.dart';

class ViewMoreLandView extends BaseView<ViewMoreLandController> {
  const ViewMoreLandView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        body: Obx(() => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  color: Colors.greenAccent,
                  backgroundColor: Colors.grey,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 19,
                        child: Center(
                          child: Text(
                            'Khu cach tác',
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
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          Get.toNamed(Routes.MORE_LAND);
                        },
                      ),
                      const Expanded(child: SizedBox())
                    ],
                  )),
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        Obx(
                          () => FlutterMap(
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
                              PolylineLayer(
                                  polylines: controller.listPolyline.value),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Obx(
                      () => controller.listArea.value.isEmpty
                          ? Text(
                              'Chua co manh dat nao',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyleConstant.grey16RobotoBold,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            )
                          : Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Danh sách khu canh tác',
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyleConstant
                                              .black22RobotoBold,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            controller.showAll();
                                          },
                                          child: Text(
                                            'Chọn nhanh tất cả',
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyleConstant
                                                  .blueRegular16,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Obx(() {
                                    controller.listToView.value;
                                    return ListView.builder(
                                      itemCount:
                                          controller.listArea.value.length,
                                      itemBuilder: (context, index) => ListTile(
                                        onTap: () {
                                          controller.changeStatus(
                                              controller.listArea[index]);
                                        },
                                        title: Text(
                                          controller.listArea[index].name,
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyleConstant
                                                .black22RobotoBold,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                        subtitle: Text(
                                          controller
                                              .listArea[index].description,
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyleConstant
                                                .grey16RobotoBold,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        trailing: controller.listToView.value
                                                .contains(controller
                                                    .listArea.value[index])
                                            ? const Icon(
                                                Icons.check_box,
                                                color: Colors.green,
                                              )
                                            : const Icon(
                                                Icons.check_box_outline_blank,
                                                color: Colors.green,
                                              ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              )));
  }
}
