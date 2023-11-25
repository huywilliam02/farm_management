import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/app/core/common/common_app_bar.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/requestform/request_form_controller.dart';
import 'package:itfsd/presentation/page/requestform/more_request_form_view.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';

class RequestformViewAll extends BaseView<RequestformController> {
  const RequestformViewAll({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        await Get.find<RequestformController>().refeshDataRequestForm();
      },
      child: Scaffold(
          backgroundColor: ColorConstant.background_color,
          appBar: CommonAppBar(
            title: 'Phiếu yêu cầu',
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
                  controller.refeshForm();
                  Get.to(() => RequestformView());
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: Column(
            children: [
              const CommonDivider(),
              TextField(
                onChanged: (value) async {
                  await controller.onTypingRequestFormDetail(value);
                },
                decoration: const InputDecoration(
                  hintText: "Tìm kiếm",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const CommonDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Yêu cầu ${controller.itemCount}",
                      style: AppTextStyle.textShowData,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Image(
                            height: 30,
                            image: AssetImage(
                              "assets/icons/filter.png",
                            ),
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
                      : ListView.separated(
                          controller: controller.requestformController,
                          padding: const EdgeInsets.all(15),
                          itemCount: controller.listRequestForm.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const CommonDivider(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                controller.showData(
                                  controller.listRequestForm.value[index],
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 1, vertical: 2),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller
                                                  .listRequestForm[index].name,
                                              style: AppTextStyle.textNameData,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Số lượng : ${controller.listRequestForm[index].quantity}",
                                              style:
                                                  AppTextStyle.textNumberData,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 35,
                                                  width: 120,
                                                  color: controller
                                                              .listRequestForm[
                                                                  index]
                                                              .status ==
                                                          1
                                                      ? Colors.green
                                                      : Colors.amberAccent,
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Image.asset(
                                                          controller
                                                                      .listRequestForm[
                                                                          index]
                                                                      .status ==
                                                                  1
                                                              ? "assets/icons/thumbs-up.png"
                                                              : "assets/icons/wait.png",
                                                          width: 26,
                                                        ),
                                                        Obx(
                                                          () => Text(
                                                            controller
                                                                        .listRequestForm[
                                                                            index]
                                                                        .status ==
                                                                    1
                                                                ? controller
                                                                    .listStatusDropdown
                                                                    .first
                                                                : controller
                                                                    .listStatusDropdown
                                                                    .last,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
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
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              "assets/icons/next.png",
                                              height: 15,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        )),
                                        const SizedBox(
                                          width: 20,
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
              controller.lazyLoading.value
                  ? const CommonLoadingPageProgressIndicator()
                  : const SizedBox()
            ],
          )),
    );
  }
}
