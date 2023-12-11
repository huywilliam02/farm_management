// user_profile_page.dart

import 'package:flutter/material.dart';
import 'package:itfsd/app/components/support_view.dart';
import 'package:itfsd/app/components/term_and_privace_view.dart';
import 'package:itfsd/app/core/common/dialog/dialog_icon_button.dart';
import 'package:itfsd/app/core/common/dialog/material_dialogs.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';
import 'package:itfsd/app/core/shared/format/date_time_format_constants.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/app/util/date_time_utils.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/edit_profile/edit_profile_controller.dart';
import 'package:itfsd/presentation/page/account/account.dart';
import 'package:lottie/lottie.dart';

class InformationPage extends BaseView<EditProfileController> {
  const InformationPage({
    super.key,
  });

  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Thông tin cá nhân",
        titleType: AppBarTitle.text,
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () {
          Get.back();
        },
        actions: [
          IconButton(
              onPressed: () {
                if (controller.loginModel.value != null) {
                  controller.showData(controller.loginModel.value!);
                } else {
                  // Handle the case where selectedUser is null
                  print("selectedUser is null");
                }
              },
              icon: const Icon(IconsUtils.edit))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: "http://116.118.49.43:8878${controller.avatar}",
                      errorWidget: (context, url, error) {
                        return Image.asset("assets/images/avatar.png");
                      },
                      progressIndicatorBuilder: (context, url, progress) {
                        return const LoadingItem();
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    controller.fullname.value,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    controller.email.value,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Chức vụ: ${controller.jobTitle.value}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Số điện thoại: ${controller.phoneNumber.value}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Địa chỉ: ${controller.homeTown.value}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Thông tin chi tiết",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    controller.description.value,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    softWrap: true,
                  ),
                  CommonDivider(),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  SettingItem(
                    title: "Trung tâm hỗ trợ",
                    icon: Ionicons.person,
                    bgColor: Colors.green,
                    iconColor: Colors.white,
                    onTap: () {
                      Get.to(() => SupportCenterPage());
                    },
                  ),
                  const SizedBox(height: 20),
                  SettingItem(
                    title: "Điều khoản và Chính sách",
                    icon: Ionicons.book_outline,
                    bgColor: Colors.grey,
                    iconColor: Colors.white,
                    onTap: () {
                      Get.to(() => TermsAndPrivacyPage());
                    },
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
          ],
        ),
      ),
    );
  }
}
