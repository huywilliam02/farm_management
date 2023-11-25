import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:itfsd/app/core/common/common_app_bar.dart';
import 'package:itfsd/app/core/common/common_scaffold.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';
import 'package:itfsd/presentation/controllers/ingredients/ingredients_controller.dart';
import 'package:itfsd/presentation/page/ingredients/create_ingredients_view.dart';

class IngredientsView extends BaseView<IngredientsController> {
  const IngredientsView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Get.find<IngredientsController>().refeshDataIngredient();
        return true;
      },
      child: CommonScaffold(
        backgroundColor: ColorConstant.background_color,
        appBar: CommonAppBar(
          title: 'Kho nguyên liệu',
          titleType: AppBarTitle.text,
          titleTextStyle: AppTextStyle.textTitleAppBar,
          centerTitle: true,
          leadingIcon: const Icon(Icons.arrow_back_ios_new),
          onLeadingPressed: () {
            Get.offAllNamed(Routes.MAIN_TABVIEW);
          },
          actions: [
            IconButton(
                onPressed: () {
                  controller.refeshFormIngredients();
                  Get.to(() => CreateIngredientsView());
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              const CommonDivider(),
              TextField(
                onChanged: (value) async {
                  await controller.onTypingSearch(value);
                },
                decoration: const InputDecoration(
                  hintText: "Tìm kiếm",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const CommonDivider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Hiện thị :  2",
                      style: AppTextStyle.textShowData,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Image(
                            height: 30,
                            image: AssetImage("assets/icons/filter.png"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 9,
                child: Obx(
                  () => controller.isLoading.value
                      ? const CommonLoadingPageProgressIndicator()
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                controller:
                                    controller.ingredientsscrollController,
                                primary: false,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.showDataIngredients(
                                        controller.listIngredients.value[index],
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.network(
                                                          HttpNetWorkUrlApi
                                                                  .baseURL +
                                                              controller
                                                                  .listIngredients[
                                                                      index]
                                                                  .images
                                                                  .first,
                                                          fit: BoxFit.cover,
                                                          height: 50,
                                                          width: 50,
                                                        ),
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
                                                                        .listIngredients[
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
                                                                    "Số lượng : ${controller.listIngredients[index].quantity}",
                                                                    style: AppTextStyle
                                                                        .textNumberData,
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "${controller.listIngredients[index].money.toInt()}đ",
                                                                            style:
                                                                                AppTextStyle.textPriceData,
                                                                          ),
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
                                                                            DateFormat("dd/MM/yyyy").format(DateTime.parse(controller.listIngredients[index].time)),
                                                                            style:
                                                                                AppTextStyle.textDateTimeData,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    height: 35,
                                                                    width: 125,
                                                                    color: controller.listIngredients[index].status ==
                                                                            1
                                                                        ? Colors
                                                                            .blue
                                                                        : Colors
                                                                            .grey,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Image
                                                                              .asset(
                                                                            controller.listIngredients[index].status == 1
                                                                                ? "assets/icons/wholesale.png"
                                                                                : "assets/icons/purchaser.png",
                                                                            width:
                                                                                26,
                                                                          ),
                                                                          Obx(
                                                                            () =>
                                                                                Text(
                                                                              controller.dropdownValue.value,
                                                                              style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w700,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
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
                                    const CommonDivider(),
                                itemCount:
                                    controller.listIngredients.value.length,
                              ),
                            ),
                            controller.lazyLoading.value
                                ? const CommonLoadingPageProgressIndicator()
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
