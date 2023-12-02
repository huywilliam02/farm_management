import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../controllers/view_landfull/tab_viewlandfull/view_landfull_controller.dart';

class ViewLandfullView extends BaseView<ViewLandfullController> {
  const ViewLandfullView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
        backgroundColor: ColorConstant.background_color,
        appBar: CommonAppBar(
          title: "Vùng canh tác",
          titleType: AppBarTitle.text,
          centerTitle: true,
          titleTextStyle: AppTextStyle.textTitleAppBar,
          leadingIcon: const Icon(Icons.arrow_back_ios_new),
          onLeadingPressed: () {
            Get.back();
          },
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Get.toNamed(Routes.LAND_DIVISION);
              },
            ),
          ],
        ),
        body: Obx(() => controller.isLoading.value
            ? const CommonLoadingPageProgressIndicator()
            : Column(
                children: [
                  Expanded(
                    flex: 6,
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
                              PolygonLayer(
                                polygons: controller.listPolygon.value.toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Obx(
                      () => controller.listLand.value.isEmpty
                          ? const Text('Chưa có vùng canh tác nào')
                          : Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text('Danh sách vùng canh tác'),
                                      TextButton(
                                        onPressed: () {
                                          controller.showAll();
                                        },
                                        child: const Text('Chọn nhanh tất cả'),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Obx(() {
                                    controller.listToView.value;
                                    return ListView.builder(
                                      itemCount:
                                          controller.listLand.value.length,
                                      itemBuilder: (context, index) => ListTile(
                                        onTap: () {
                                          controller.changeStatus(
                                              controller.listLand[index]);
                                        },
                                        title: Text(
                                            controller.listLand[index].name!),
                                        trailing: controller.listToView.value
                                                .contains(
                                          controller.listLand.value[index],
                                        )
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
