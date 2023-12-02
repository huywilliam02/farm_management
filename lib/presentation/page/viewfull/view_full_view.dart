import 'package:itfsd/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:itfsd/presentation/page/viewfull/widgets/product_type_view.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:latlong2/latlong.dart';

import '../../controllers/viewfull/view_full_controller.dart';

class ViewFullView extends BaseView<ViewFullController> {
  const ViewFullView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: SizedBox(
              height: 700,
              child: Stack(
                children: [
                  Obx(() {
                    return FlutterMap(
                      mapController: controller.mapController,
                      options: MapOptions(
                        center:
                            const LatLng(10.877541358205578, 106.8088219685599),
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
                          polygons: controller.listPolygon.toList(),
                        ),
                        PolylineLayer(
                          polylines: controller.listPolyline.toList(),
                        ),
                        MarkerLayer(markers: controller.listMarker.value),
                        SizedBox(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back_ios_new),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              IconButton(
                                icon: Image.asset(
                                  "assets/icons/product.png",
                                  width: 100,
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.0),
                                      ),
                                    ),
                                    builder: (context) {
                                      return SizedBox(
                                        height:
                                            UtilsReponsive.height(context, 500),
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: UtilsReponsive.height(
                                                  context, 10),
                                            ),
                                            Expanded(
                                              child: ListView.separated(
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  return const ProductTypeView();
                                                },
                                                separatorBuilder:
                                                    (context, index) =>
                                                        const SizedBox(
                                                  height: 10,
                                                ),
                                                itemCount: controller
                                                    .listProduct.value.length,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
