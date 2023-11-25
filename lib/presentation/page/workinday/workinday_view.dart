import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:itfsd/app/components/buttons/list_icon_view_tree.dart';
import 'package:itfsd/app/core/common/common_app_bar.dart';
import 'package:itfsd/app/core/common/common_scaffold.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:itfsd/presentation/page/workinday/calendar_view.dart';
import 'package:itfsd/presentation/page/workinday/more_workinday.dart';
import '../../../../presentation/controllers/workinday/workinday_controller.dart';

class WorkindayView extends BaseView<WorkindayController> {
  const WorkindayView({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        await Get.find<WorkindayController>().refeshData();
      },
      child: CommonScaffold(
        backgroundColor: ColorConstant.background_color,
        appBar: CommonAppBar(
          title: "Việc làm trong ngày",
          titleTextStyle: AppTextStyle.textTitleAppBar,
          centerTitle: true,
          titleType: AppBarTitle.text,
          leadingIcon: const Icon(Icons.arrow_back_ios_new),
          onLeadingPressed: () {
            
            Get.offAll(() => const ListIconTreeView());
          },
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                controller.refeshForm();
                Get.to(() => MoreWorkInDayView());
              },
            ),
          ],
        ),
        body: Column(
          children: [
            const CommonDivider(),
            TextField(
              onChanged: (value) async {
                await controller.onTypingSearchWorkInDay(value);
              },
              decoration: const InputDecoration(
                hintText: "Tìm kiếm",
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const CommonDivider(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hiện thị: 5 ",
                    style: AppTextStyle.textShowData,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(() => const CalendarWorkindayView());
                        },
                        icon: const Image(
                          height: 30,
                          image: AssetImage(
                            "assets/icons/schedule.png",
                          ),
                        ),
                      ),
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
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.showData(
                                controller.listWorkinday.value[index],
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 2),
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
                                                    controller
                                                        .listWorkinday[index]
                                                        .job!,
                                                    style: GoogleFonts.roboto(
                                                      textStyle:
                                                          TextStyleConstant
                                                              .black22RobotoBold,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: UtilsReponsive.height(
                                                  context, 5),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Ngày thực hiện : ${DateFormat("dd/MM/yyyy").format(DateTime.parse(controller.listWorkinday[index].implementAt.toString()))}",
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyleConstant
                                                        .grey16RobotoBold,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: UtilsReponsive.height(
                                                  context, 5),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Thời gian : ${controller.listWorkinday[index].completedAt}",
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyleConstant
                                                        .grey16RobotoBold,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      )
                                    ],
                                  ),
                                  const CommonDivider(),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: controller.listWorkinday.value.length,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
