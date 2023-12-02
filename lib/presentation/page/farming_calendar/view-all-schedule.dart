import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/farming_calendar/farming_calendar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/presentation/page/farming_calendar/farming_calendar_view.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';

class ViewAllSchedule extends BaseView<FarmingCalendarController> {
  const ViewAllSchedule({super.key});

  @override
  Widget buildView(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Get.find<FarmingCalendarController>().refeshData();
        return true;
      },
      child: CommonScaffold(
        backgroundColor: ColorConstant.background_color,
        appBar: CommonAppBar(
          title: 'Lịch cach tác',
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
                  Get.to(() => FarmingCalendarView());
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonDivider(),
              TextField(
                onChanged: (value) async {
                  await controller.onTypingSearchFarmingcalendar(value);
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
                      style: TextStyle(
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
                                    controller.farmingCalendarscrollController,
                                primary: false,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.showData(
                                        controller.listSchedule.value[index],
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
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
                                                            "Sản phẩm : ${controller.listSchedule.value[index].productName!}",
                                                            style: GoogleFonts
                                                                .roboto(
                                                              // textStyle: Theme.of(context).textTheme.displayLarge,
                                                              textStyle:
                                                                  TextStyleConstant
                                                                      .black22RobotoBold,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          UtilsReponsive.height(
                                                              context, 5),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Số lượng: ${controller.listSchedule.value[index].numberOfVarites!}",
                                                          style: GoogleFonts
                                                              .roboto(
                                                            textStyle:
                                                                TextStyleConstant
                                                                    .grey16RobotoBold,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          UtilsReponsive.height(
                                                              context, 5),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Sản lượng : ${controller.listSchedule.value[index].expectOutput!}",
                                                          style: GoogleFonts
                                                              .roboto(
                                                            textStyle:
                                                                TextStyleConstant
                                                                    .black22RobotoBold,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: UtilsReponsive
                                                              .width(
                                                                  context, 5),
                                                        ),
                                                        Text(
                                                          "( ${controller.listSchedule.value[index].unit!} )",
                                                          style: GoogleFonts
                                                              .roboto(
                                                            // textStyle: Theme.of(context).textTheme.displayLarge,
                                                            textStyle:
                                                                TextStyleConstant
                                                                    .black22RobotoBold,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          UtilsReponsive.height(
                                                              context, 5),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Bắt đầu : ${DateFormat("dd/MM/yyyy").format(DateTime.parse(controller.listSchedule[index].startDay.toString()))}",
                                                          style: GoogleFonts
                                                              .roboto(
                                                            textStyle:
                                                                TextStyleConstant
                                                                    .grey16RobotoBold,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: UtilsReponsive
                                                              .width(
                                                                  context, 10),
                                                        ),
                                                        Text(
                                                          "Kết thúc : ${DateFormat("dd/MM/yyyy").format(DateTime.parse(controller.listSchedule[index].endDate.toString()))}",
                                                          style: GoogleFonts
                                                              .roboto(
                                                            textStyle:
                                                                TextStyleConstant
                                                                    .grey16RobotoBold,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Image.asset(
                                                "assets/icons/next.png",
                                                height: 15,
                                                color: Colors.grey,
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
                                itemCount: controller.listSchedule.value.length,
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
