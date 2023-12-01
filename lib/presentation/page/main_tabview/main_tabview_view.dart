import 'dart:math' as math;
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/core/constants/app_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/main_tabview/main_tabview_controller.dart';

class MainTabView extends BaseView<MainTabviewController> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  MainTabView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) => false,
      // onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: ColorConstant.background_color,
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Center(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(
                  math.pi / 4,
                ),
                child: Container(
                  width: UtilsReponsive.width(context, 120),
                  height: UtilsReponsive.height(context, 120),
                  decoration: const BoxDecoration(
                    color: ColorConstant.background_color,
                    border: Border(
                      right: BorderSide(
                          width: 1, color: ColorConstant.background_color),
                      bottom: BorderSide(
                          width: 1, color: ColorConstant.background_color),
                    ),
                  ),
                  child: Container(
                    width: UtilsReponsive.width(context, 100),
                    height: UtilsReponsive.height(context, 100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: ColorConstant.blueGradient,
                      ),
                      border: Border.all(
                        width: 3,
                        color: ColorConstant.white,
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
                          child: const Icon(
                            Icons.map_rounded,
                            color: ColorConstant.secondary1,
                          ),
                        ),
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
              shape: const CircularNotchedRectangle(),
              notchMargin: 0,
              child: SizedBox(
                height: UtilsReponsive.height(context, 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    Image.asset(
                                      "assets/icons/home.png",
                                      height: 30,
                                      color: controller.selectedIndex.value == 0
                                          ? ColorConstant.secondary
                                          : ColorConstant.secondary1,
                                    ),
                                    Text(
                                      'Trang chủ',
                                      style: TextStyle(
                                        color:
                                            controller.selectedIndex.value == 0
                                                ? ColorConstant.secondary
                                                : ColorConstant.secondary1,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                controller.onItemTapped1(1);
                              },
                              minWidth: UtilsReponsive.width(context, 40),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icons/farm.png",
                                      height: 30,
                                      color: controller.selectedIndex.value == 1
                                          ? ColorConstant.secondary
                                          : ColorConstant.secondary1,
                                    ),
                                    Text(
                                      'Nông trại',
                                      style: TextStyle(
                                        color:
                                            controller.selectedIndex.value == 1
                                                ? ColorConstant.secondary
                                                : ColorConstant.secondary1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                controller.onItemTapped1(2);
                              },
                              minWidth: UtilsReponsive.width(context, 40),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icons/blogger.png",
                                      height:
                                          UtilsReponsive.height(context, 30),
                                      color: controller.selectedIndex.value == 2
                                          ? ColorConstant.secondary
                                          : ColorConstant.secondary1,
                                    ),
                                    Text(
                                      'Nhật ký',
                                      style: TextStyle(
                                        // fontSize: 20,
                                        color:
                                            controller.selectedIndex.value == 2
                                                ? ColorConstant.secondary
                                                : ColorConstant.secondary1,
                                      ),
                                    ),
                                  ],
                                ),
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
                                    Image.asset(
                                      "assets/icons/user.png",
                                      height: 30,
                                      color: controller.selectedIndex.value == 3
                                          ? ColorConstant.secondary
                                          : ColorConstant.secondary1,
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Tài khoản',
                                      style: TextStyle(
                                        color:
                                            controller.selectedIndex.value == 3
                                                ? ColorConstant.secondary
                                                : ColorConstant.secondary1,
                                      ),
                                    ),
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
