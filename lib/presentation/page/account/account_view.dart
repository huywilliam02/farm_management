import 'package:flutter/material.dart';
import 'package:itfsd/app/core/common/dialog/dialog_icon_button.dart';
import 'package:itfsd/app/core/common/dialog/icon_outline_button.dart';
import 'package:itfsd/app/core/common/dialog/material_dialogs.dart';
import 'package:itfsd/app/core/shared/dialog/types.dart';
import 'package:itfsd/presentation/controllers/users/edit_user/edit_user_controller.dart';
import 'package:itfsd/presentation/controllers/users/users_controller.dart';
import 'package:lottie/lottie.dart';
import 'account.dart';

class AccountView extends BaseView<AccountController> {
  AccountView({Key? key, this.userId}) : super(key: key);
  String? userId;
  @override
  Widget buildView(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Text(
                  "Cài đặt",
                  style: AppTextStyle.textTitleAppBar,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Tài khoản",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Obx(
                  () => controller.isLoading.value
                      ? CommonLoadingPageProgressIndicator()
                      : InkWell(
                          onTap: () {
                            // print('selectedUser: ${controller.loginModel.value}');

                            controller.showData(controller.loginModel.value!);
                          },
                          child: Row(
                            children: [
                              Container(
                                clipBehavior: Clip.hardEdge,
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "http://116.118.49.43:8878${controller.avatar}",
                                  errorWidget: (context, url, error) {
                                    return Image.asset(
                                        "assets/images/avatar.png");
                                  },
                                  progressIndicatorBuilder:
                                      (context, url, progress) {
                                    return const LoadingItem();
                                  },
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.fullName.value,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.roleConstants
                                        .getRoleLabel(controller.role.value),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Icon(
                                Ionicons.chevron_forward_outline,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Cài đặt",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Thêm thành viên",
                icon: Ionicons.people,
                bgColor: Colors.blueGrey,
                iconColor: Colors.white,
                onTap: () {
                  Get.toNamed(Routes.USERS);
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Ngôn ngữ",
                icon: Ionicons.earth,
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                value: "Tiếng việt",
                onTap: () {
                  Get.toNamed(Routes.SETTING_LANGUAGE);
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Theo dõi thiết bị",
                icon: Ionicons.desktop_outline,
                bgColor: Colors.indigo,
                iconColor: Colors.white,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Thông báo",
                icon: Ionicons.notifications,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingSwitch(
                title: "Dark Mode",
                icon: Ionicons.earth,
                bgColor: Colors.purple.shade100,
                iconColor: Colors.purple,
                value: controller.isDarkMode,
                onTap: (value) {
                  controller.isDarkMode = value;
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Trung tâm hỗ trợ",
                icon: Ionicons.person,
                bgColor: Colors.green,
                iconColor: Colors.white,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Điều khoản và Chính sách",
                icon: Ionicons.book_outline,
                bgColor: Colors.grey,
                iconColor: Colors.white,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Đăng xuất",
                icon: Ionicons.log_out,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {
                  Dialogs.materialDialog(
                      msg: 'Bạn có chắc chắn muốn thoát chứ',
                      title: "Đăng xuất tài khoản",
                      color: Colors.white,
                      context: context,
                      lottieBuilder: Lottie.asset(
                        'assets/animations/loy_out.json',
                        fit: BoxFit.contain,
                      ),
                      actions: [
                        DiaLogIconsButton(
                          onPressed: () {
                            Get.back();
                          },
                          text: 'Trở lại',
                          iconData: Icons.cancel_outlined,
                          color: Colors.white,
                          textStyle: TextStyle(color: Colors.grey),
                          iconColor: Colors.grey,
                        ),
                        DiaLogIconsButton(
                          onPressed: () {
                            controller.logout();
                          },
                          text: 'Đồng ý',
                          iconData: Ionicons.log_out,
                          color: Colors.green,
                          textStyle: TextStyle(color: Colors.white),
                          iconColor: Colors.white,
                        ),
                      ]);
                  // controller.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
