import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';

import '../../../controllers/area/view_area/view_area_controller.dart';

class ViewAreaView extends BaseView<ViewAreaController> {
  const ViewAreaView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khu canh tác'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  color: Colors.greenAccent,
                  backgroundColor: Colors.grey,
                ),
              )
            : Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Obx(
                      () => controller.listArea.value.isEmpty
                          ? Text(
                              'Chưa có khu canh tác nào',
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
                                  flex: 5,
                                  child: Obx(
                                    () => GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 12,
                                              childAspectRatio: 0.9 / 1.2),
                                      itemCount: controller.listArea.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                          elevation: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      width: double.infinity,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      child: Image.network(
                                                        HttpNetWorkUrlApi
                                                                .baseURL +
                                                            controller
                                                                .listArea[index]
                                                                .avatars!
                                                                .first,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 8),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 4,
                                                      vertical: 2),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          controller
                                                              .listArea[index]
                                                              .name,
                                                          style: GoogleFonts
                                                              .roboto(
                                                            textStyle:
                                                                TextStyleConstant
                                                                    .grey16RobotoBold,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                          ),
                                                        ),
                                                      ),
                                                      const Icon(
                                                        Icons.star,
                                                        size: 16,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    const Text(
                                                      "Diện tích : ",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      controller.listArea[index]
                                                          .acreage
                                                          .toInt()
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
