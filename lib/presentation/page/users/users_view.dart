import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
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
            onPressed: () => Get.to(() => const CreateUsersView()),
            icon: const Icon(IconsUtils.add),
          )
        ],
      ),
      body: const Center(
        child: Text(
          'UsersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
