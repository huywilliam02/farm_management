import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';
import 'package:itfsd/presentation/controllers/agricultural_products/agricultural_products_controller.dart';
import 'package:itfsd/presentation/page/agricultural_products/create_AgriculralProduct_view.dart';

class AgriculturalProductsView
    extends BaseView<AgriculturalProductsController> {
  const AgriculturalProductsView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Get.find<AgriculturalProductsController>()
            .refeshDataAgriculturalProduct();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Get.offAllNamed(Routes.MAIN_TABVIEW);
                      // Get.offAll(() => const ListIconwarehouseView());
                    },
                  ),
                  Expanded(
                    flex: 18,
                    child: Center(
                      child: Text(
                        'Kho thu hoạch',
                        style: AppTextStyle.textTitleAppBar,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      controller.refeshFormAgriculturalProduct();
                      Get.to(() => CreateAgriculralProductView());
                    },
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              TextField(
                onChanged: (value) async {
                  await controller.onTypingSearchAgriculturalProduct(value);
                },
                decoration: const InputDecoration(
                  hintText: "Tìm kiếm",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              Obx(
                () => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hiện thị :  ${controller.listAgriculturalProduct.length}",
                            style: AppTextStyle.textShowData,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Image(
                                  image: AssetImage("assets/icons/filter.png"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Obx(
                  () => controller.isLoading.value
                      ? Center(
                          child: SizedBox(
                            height: UtilsReponsive.height(context, 40),
                            width: UtilsReponsive.width(context, 40),
                            child: const CircularProgressIndicator(
                              strokeWidth: 5,
                              color: Colors.greenAccent,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                controller: controller
                                    .agriculturalProductscrollController,
                                primary: false,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.showDataAgriculturalProduct(
                                        controller.listAgriculturalProduct
                                            .value[index],
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        // Image.network(
                                                        //   HttpNetWorkUrlApi
                                                        //           .baseURL +
                                                        //       controller
                                                        //           .listAgriculturalProduct[
                                                        //               index]
                                                        //           .images
                                                        //           .first,
                                                        //   fit: BoxFit.cover,
                                                        //   height: 50,
                                                        //   width: 50,
                                                        // ),
                                                        SizedBox(
                                                          width: UtilsReponsive
                                                              .width(
                                                                  context, 15),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    controller
                                                                        .listAgriculturalProduct[
                                                                            index]
                                                                        .name,
                                                                    style: AppTextStyle
                                                                        .textNameData,
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                      "Số lượng : ${controller.listAgriculturalProduct[index].quantity}",
                                                                      style: AppTextStyle
                                                                          .textNumberData),
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                              "${controller.listAgriculturalProduct[index].money.toInt()}đ",
                                                                              style: AppTextStyle.textPriceData),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height: UtilsReponsive.height(
                                                                            context,
                                                                            2),
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            DateFormat("dd/MM/yyyy").format(DateTime.parse(controller.listAgriculturalProduct[index].time)),
                                                                            style:
                                                                                AppTextStyle.textDateTimeData,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              // Row(
                                                              //   children: [
                                                              //     Container(
                                                              //       height: 30,
                                                              //       width: 120,
                                                              //       color: controller.listAgriculturalProduct[index].status ==
                                                              //               1
                                                              //           ? Colors
                                                              //               .blue
                                                              //           : Colors
                                                              //               .grey,
                                                              //       child:
                                                              //           Center(
                                                              //         child:
                                                              //             Text(
                                                              //           controller
                                                              //               .dropdownValue
                                                              //               .value = controller.listAgriculturalProduct[index].status ==
                                                              //                   1
                                                              //               ? controller.listStatusDropdown.first
                                                              //               : controller.listStatusDropdown.last,
                                                              //           style:
                                                              //               const TextStyle(
                                                              //             color:
                                                              //                 Colors.white,
                                                              //             fontSize:
                                                              //                 14,
                                                              //             fontWeight:
                                                              //                 FontWeight.w700,
                                                              //           ),
                                                              //         ),
                                                              //       ),
                                                              //     ),
                                                              //   ],
                                                              // ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 25,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(
                                  color: Colors.grey,
                                  indent: 1,
                                  height: 4,
                                ),
                                itemCount: controller
                                    .listAgriculturalProduct.value.length,
                              ),
                            ),
                            controller.lazyLoading.value
                                ? const CircularProgressIndicator(
                                    strokeWidth: 5,
                                    color: Colors.greenAccent,
                                    backgroundColor: Colors.grey,
                                  )
                                : const SizedBox()
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
