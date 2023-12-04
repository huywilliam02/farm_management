import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/app/util/date_time_utils.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/page/users/users_create_view.dart';

import '../../controllers/users/users_controller.dart';

class UsersView extends BaseView<UsersController> {
  const UsersView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Thành viên nông trại",
        titleType: AppBarTitle.text,
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () => Get.back(),
        actions: [
          IconButton(
            onPressed: () {
              controller.refreshForm();
              Get.to(() => CreateUsersView(), transition: Transition.fadeIn);
            },
            icon: const Icon(IconsUtils.add),
          )
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
              controller: controller.userscrollController,
              primary: false,
              itemBuilder: (context, index) {
                var user = controller.listUsers[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: InkWell(
                    onTap: () {
                      controller.showUserDetails(user);
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
                                      Container(
                                        clipBehavior: Clip.hardEdge,
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "http://116.118.49.43:8878${controller.listUsers.value[index].avatar}",
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                            "assets/images/avatar.png",
                                          ),
                                          progressIndicatorBuilder: (context,
                                                  url, progress) =>
                                              const CommonLoadingPageProgressIndicator(),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller
                                                .listUsers[index].fullName,
                                            style: AppTextStyle.textNameData,
                                          ),
                                          Text(
                                            controller.listUsers[index]
                                                        .updatedAt !=
                                                    null
                                                ? DateTimeUtils.tryParse(
                                                      date: controller
                                                          .listUsers[index]
                                                          .updatedAt
                                                          .toString(),
                                                      format: 'yyyy-MM-dd H:mm',
                                                    )?.toStringWithFormat(
                                                        'yyyy-MM-dd H:mm') ??
                                                    'Invalid date'
                                                : 'No date available',
                                            style: AppTextStyle.textNumberData,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/icons/next.png",
                                  height: 15,
                                  color: Colors.grey,
                                ),
                              ],
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
              itemCount: controller.listUsers.value.length,
            ),
    );
  }
}
