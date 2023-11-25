import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:flutter/material.dart';

import 'package:itfsd/app/core/constants/app_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import '../../controllers/edit_profile/edit_profile_controller.dart';

class EditProfileView extends BaseView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: UtilsReponsive.height(context, 10),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: UtilsReponsive.width(context, 40),
                    ),
                    Expanded(
                      flex: 9,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Tài khoản',
                              style: GoogleFonts.roboto(
                                // textStyle: Theme.of(context).textTheme.displayLarge,
                                textStyle: TextStyleConstant.black16Roboto,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            SizedBox(
                              height: UtilsReponsive.height(context, 10),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: UtilsReponsive.width(context, 7),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: UtilsReponsive.height(context, 5),
              ),
              Stack(
                children: [
                  Obx(
                    () => controller.isLoading.value
                        ? const CommonLoadingPageProgressIndicator()
                        : Container(
                            height: 200,
                            color: Colors.white,
                            width: double.infinity,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: UtilsReponsive.height(context, 20),
                                ),
                                const CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: NetworkImage(
                                    "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=2000",
                                  ),
                                ),
                                SizedBox(
                                  height: UtilsReponsive.height(context, 10),
                                ),
                                Text(
                                  "Huy",
                                  style: GoogleFonts.roboto(
                                    // textStyle: Theme.of(context).textTheme.displayLarge,
                                    textStyle:
                                        TextStyleConstant.grey16RobotoBold,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: UtilsReponsive.height(context, 10),
                                ),
                                Text(
                                  controller.userName.value,
                                  style: GoogleFonts.roboto(
                                    // textStyle: Theme.of(context).textTheme.displayLarge,
                                    textStyle:
                                        TextStyleConstant.black22RobotoBold,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
              SizedBox(
                height: UtilsReponsive.height(context, 5),
              ),
              InkWell(
                onTap: () {
                  // controller.logout();
                },
                child: Stack(
                  children: [
                    Container(
                      height: 50,
                      color: Colors.white,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(
                            width: UtilsReponsive.width(context, 20),
                          ),
                          const Icon(Icons.person),
                          SizedBox(
                            width: UtilsReponsive.width(context, 18),
                          ),
                          Expanded(
                            child: Text(
                              "Trang cá nhân",
                              style: GoogleFonts.roboto(
                                // textStyle: Theme.of(context).textTheme.displayLarge,
                                textStyle: TextStyleConstant.black16Roboto,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 75,
                          ),
                          Expanded(
                            child: Image.asset(
                              "assets/icons/next.png",
                              height: UtilsReponsive.height(context, 15),
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: UtilsReponsive.height(context, 5),
              ),
              InkWell(
                onTap: () {
                  // controller.logout();
                },
                child: Stack(
                  children: [
                    Container(
                      height: 50,
                      color: Colors.white,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(
                            width: UtilsReponsive.width(context, 20),
                          ),
                          Image.asset(
                            "assets/icons/security-camera.png",
                            width: 25,
                          ),
                          SizedBox(
                            width: UtilsReponsive.width(context, 18),
                          ),
                          Expanded(
                            child: Text(
                              "Theo dõi thiết bị",
                              style: GoogleFonts.roboto(
                                // textStyle: Theme.of(context).textTheme.displayLarge,
                                textStyle: TextStyleConstant.black16Roboto,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 75,
                          ),
                          Expanded(
                            child: Image.asset(
                              "assets/icons/next.png",
                              height: UtilsReponsive.height(context, 15),
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: UtilsReponsive.height(context, 5),
              ),
              InkWell(
                onTap: () {
                  // controller.logout();
                },
                child: Stack(
                  children: [
                    Container(
                      height: 50,
                      color: Colors.white,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(
                            width: UtilsReponsive.width(context, 20),
                          ),
                          const Icon(Icons.settings),
                          SizedBox(
                            width: UtilsReponsive.width(context, 20),
                          ),
                          Expanded(
                            child: Text(
                              "Cài đặt",
                              style: GoogleFonts.roboto(
                                // textStyle: Theme.of(context).textTheme.displayLarge,
                                textStyle: TextStyleConstant.black16Roboto,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          const SizedBox(width: 75),
                          Expanded(
                            child: Image.asset(
                              "assets/icons/next.png",
                              height: UtilsReponsive.height(context, 15),
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: UtilsReponsive.height(context, 5),
              ),
              InkWell(
                onTap: () {
                  // controller.logout();
                },
                child: Stack(
                  children: [
                    Container(
                      height: 50,
                      color: Colors.white,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(
                            width: UtilsReponsive.width(context, 20),
                          ),
                          const Icon(Icons.language),
                          SizedBox(
                            width: UtilsReponsive.width(context, 20),
                          ),
                          Expanded(
                            child: Text(
                              "Ngôn ngữ",
                              style: GoogleFonts.roboto(
                                // textStyle: Theme.of(context).textTheme.displayLarge,
                                textStyle: TextStyleConstant.black16Roboto,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          const SizedBox(width: 75),
                          Expanded(
                            child: Image.asset(
                              "assets/icons/next.png",
                              height: UtilsReponsive.height(context, 15),
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: UtilsReponsive.height(context, 5),
              ),
              InkWell(
                onTap: () {
                  controller.logout();
                },
                child: Stack(
                  children: [
                    Container(
                      height: 50,
                      color: Colors.white,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(
                            width: UtilsReponsive.width(context, 20),
                          ),
                          const Icon(Icons.logout),
                          SizedBox(
                            width: UtilsReponsive.width(context, 20),
                          ),
                          Expanded(
                            child: Text(
                              "Đăng xuất",
                              style: GoogleFonts.roboto(
                                // textStyle: Theme.of(context).textTheme.displayLarge,
                                textStyle: TextStyleConstant.black16Roboto,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 75,
                          ),
                          Expanded(
                            child: Image.asset(
                              "assets/icons/next.png",
                              height: UtilsReponsive.height(context, 15),
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
