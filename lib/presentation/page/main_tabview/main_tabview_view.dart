import 'dart:math' as math;
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/main_tabview/main_tabview_controller.dart';

class MainTabView extends BaseView<MainTabviewController> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  MainTabView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.background_color,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: ColorConstant.background_color,
            child: Center(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(
                  math.pi / 4,
                ),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(2)),
                    color: ColorConstant.background_color,
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: ColorConstant.blueGradient,
                      ),
                      border: Border.all(
                        width: 3,
                        color: ColorConstant.grey,
                      ),
                    ),
                    child: InkWell(
                      splashColor: Colors.blueAccent,
                      onTap: () {
                        Get.toNamed(Routes.VIEW_FULL);
                      },
                      child: Center(
                        child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationZ(
                              -math.pi / 4,
                            ),
                            child: const Icon(Icons.map_outlined,
                                color: ColorConstant.secondary1)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Obx(
            () => controller.body.elementAt(
              controller.selectedIndex.value,
            ),
          ),
          bottomNavigationBar: Obx(
            () => BottomAppBar(
              color: ColorConstant.background_color,
              shape: CircularNotchedRectangle(),
              notchMargin: 0,
              child: Container(
                height: UtilsReponsive.height(context, 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                controller.onItemTapped1(0);
                              },
                              minWidth: UtilsReponsive.width(context, 40),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      IconsUtils.home,
                                      color: controller.selectedIndex.value == 0
                                          ? ColorConstant.secondary1
                                          : ColorConstant.green,
                                    ),
                                    Text("Trang chủ",
                                        style: TextStyle(
                                            color: controller
                                                        .selectedIndex.value ==
                                                    0
                                                ? ColorConstant.secondary1
                                                : ColorConstant.green))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              controller.onItemTapped1(1);
                            },
                            minWidth: UtilsReponsive.width(context, 40),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(IconsUtils.daily,
                                      color: controller.selectedIndex.value == 1
                                          ? ColorConstant.secondary1
                                          : ColorConstant.green),
                                  Text("Nhật ký",
                                      style: TextStyle(
                                          color:
                                              controller.selectedIndex.value ==
                                                      1
                                                  ? ColorConstant.secondary1
                                                  : ColorConstant.green))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              controller.onItemTapped1(2);
                            },
                            minWidth: UtilsReponsive.width(context, 40),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(IconsUtils.news,
                                      color: controller.selectedIndex.value == 2
                                          ? ColorConstant.secondary1
                                          : ColorConstant.green),
                                  Text("Bảng tin",
                                      style: TextStyle(
                                          color:
                                              controller.selectedIndex.value ==
                                                      2
                                                  ? ColorConstant.secondary1
                                                  : ColorConstant.green))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                controller.onItemTapped1(3);
                              },
                              minWidth: UtilsReponsive.width(context, 40),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(IconsUtils.person,
                                        color:
                                            controller.selectedIndex.value == 3
                                                ? ColorConstant.secondary1
                                                : ColorConstant.green),
                                    Text(
                                      "Tài khoản",
                                      style: TextStyle(
                                          color:
                                              controller.selectedIndex.value ==
                                                      3
                                                  ? ColorConstant.secondary1
                                                  : ColorConstant.green),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )

          // SafeArea(
          //   child: Builder(
          //     builder: (context) =>
          //     PandaBar(
          //       backgroundColor: ColorConstant.primary,
          //       fabIcon: const Icon(
          //         Icons.directions_run,
          //         color: ColorConstant.secondary1,
          //       ),
          //       fabColors: ColorConstant.blueGradient,
          //       buttonColor: ColorConstant.secondary,
          //       buttonSelectedColor: ColorConstant.secondary1,
          //       buttonData: controller.list,
          //       onChange: (id) {
          //         // if (id == "mine") {
          //         //   Scaffold.of(context).openEndDrawer();
          //         //   // controller.scaffoldKey.value=scaffoldKey;
          //         //   // controller.openDrawer();
          //         // } else {
          //           controller.onItemTapped(id);
          //         // }
          //       },
          //       onFabButtonPressed: () {
          //         controller.onSelectedTrackingView(context);
          //       },
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
