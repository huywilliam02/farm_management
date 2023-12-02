import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/app/util/number_format_utils.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/page/material/more_material.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';

import '../../controllers/material/material_controller.dart';

class MaterialView extends BaseView<MaterialController> {
  const MaterialView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Get.find<MaterialController>().refeshDataMaterial();
        return true;
      },
      child: CommonScaffold(
        backgroundColor: ColorConstant.background_color,
        appBar: CommonAppBar(
          title: 'Vật tư',
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
                  Get.to(() => MoreMaterialView());
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: Column(
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
                    : ListView.separated(
                        controller: controller.materialscrollController,
                        primary: false,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.showData(
                                controller.listMaterial.value[index],
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
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
                                                  HttpNetWorkUrlApi.baseURL +
                                                      controller
                                                          .listMaterial[index]
                                                          .images
                                                          .first,
                                                  fit: BoxFit.cover,
                                                  height: 50,
                                                  width: 50,
                                                ),
                                                SizedBox(
                                                  width: UtilsReponsive.width(
                                                      context, 10),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              controller
                                                                  .listMaterial[
                                                                      index]
                                                                  .name,
                                                              style: AppTextStyle
                                                                  .textNameData,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Số lượng : ${controller.listMaterial[index].quantity}",
                                                            style: AppTextStyle
                                                                .textQuantityData,
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 120,
                                                            color: controller
                                                                        .listMaterial[
                                                                            index]
                                                                        .status ==
                                                                    1
                                                                ? Colors.green
                                                                : Colors.red,
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Image.asset(
                                                                    controller.listMaterial[index].status ==
                                                                            1
                                                                        ? "assets/icons/received.png"
                                                                        : "assets/icons/box.png",
                                                                    width: 26,
                                                                  ),
                                                                  Text(
                                                                    controller
                                                                        .dropdownValue
                                                                        .value = controller.listMaterial[index].status ==
                                                                            1
                                                                        ? controller
                                                                            .listStatusDropdown
                                                                            .first
                                                                        : controller
                                                                            .listStatusDropdown
                                                                            .last,
                                                                    style: AppTextStyle
                                                                        .textButtonStatus,
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
                                      Text(
                                        NumberFormatUtils.formatDong(
                                            controller.listMaterial[index].price
                                                .toDouble()),
                                        style: AppTextStyle.textPriceData,
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
                        itemCount: controller.listMaterial.value.length,
                      ),
              ),
            ),
            controller.lazyLoading.value
                ? const CommonLoadingPageProgressIndicator()
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
