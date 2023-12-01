import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:itfsd/app/core/common/common_scaffold.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/page/account/widgets/forward_button.dart';
import 'package:itfsd/presentation/page/account/widgets/setting_item.dart';
import 'package:itfsd/presentation/page/account/widgets/setting_switch.dart';

import '../../controllers/account/controllers/account_controller.dart';

class AccountView extends BaseView<AccountController> {
  const AccountView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
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
              Obx(
                () => controller.isLoading.value
                    ? const CommonLoadingPageProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.EDIT_PROFILE);
                          },
                          child: Row(
                            children: [
                              Image.asset("assets/images/avatar.png",
                                  width: 70, height: 70),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Huy",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.userName.value,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  )
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
                  controller.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
