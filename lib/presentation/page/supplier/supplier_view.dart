import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/components/buttons/list_icon_phone_number.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/app/util/number_format_utils.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/page/supplier/create_supplier.dart';
import 'package:quickalert/quickalert.dart';
import '../../controllers/supplier/supplier_controller.dart';

class SupplierView extends BaseView<SupplierController> {
  SupplierView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async =>
          await Get.find<SupplierController>().refreshData(),
      child: CommonScaffold(
        backgroundColor: ColorConstant.background_color,
        appBar: CommonAppBar(
          title: "Nhà cung cấp",
          titleType: AppBarTitle.text,
          titleTextStyle: AppTextStyle.textTitleAppBar,
          centerTitle: true,
          leadingIcon: IconsUtils.back,
          onLeadingPressed: () {
            Get.offAll(() => const ListIconPhoneNumber());
          },
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                controller.refreshForm();
                Get.to(() => Moresupplier());
              },
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async => await controller.refreshData(),
          child: Column(
            children: [
              const CommonDivider(),
              buildSearchTextField(),
              const CommonDivider(),
              buildItemCountRow(),
              Expanded(
                flex: 9,
                child: buildSupplierList(),
              ),
              if (controller.lazyLoading.value)
                const CommonLoadingPageProgressIndicator()
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchTextField() {
    return TextField(
      onChanged: (value) async {
        await controller.onTypingSearch(value);
      },
      decoration: const InputDecoration(
        hintText: "Tìm kiếm",
        border: InputBorder.none,
        prefixIcon: Icon(Icons.search),
      ),
    );
  }

  Widget buildItemCountRow() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hiện thị: ${controller.itemCount}",
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
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
    );
  }

  Widget buildSupplierList() {
    return Obx(
      () => controller.isLoading.value
          ? const CommonLoadingPageProgressIndicator()
          : ListView.separated(
              controller: controller.supplierscrollController,
              primary: false,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: InkWell(
                    onTap: () {
                      controller.showData(controller.listSupplier.value[index]);
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          controller.listSupplier[index].name,
                                          style: AppTextStyle.textNameData,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "SĐT : ${controller.listSupplier[index].phoneNumber}",
                                        style: AppTextStyle.textNumberData,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              NumberFormatUtils.formatDong(controller
                                  .listSupplier[index].debt
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
              separatorBuilder: (context, index) => const CommonDivider(),
              itemCount: controller.listSupplier.value.length,
            ),
    );
  }
}
