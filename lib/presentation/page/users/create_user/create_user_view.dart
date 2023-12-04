import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/base/base_bindings.dart';
import 'package:itfsd/base/base_view.dart';

import '../../../controllers/users/create_user/create_user_controller.dart';

class CreateUserView extends BaseView<CreateUserController> {
  const CreateUserView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return PopScope(
      canPop: true,
      // onPopInvoked: (didPop) async =>
      // await Get.find<SupplierController>().refreshData(),
      child: CommonScaffold(
        backgroundColor: ColorConstant.background_color,
        appBar: CommonAppBar(
          title: "Thêm thành viên",
          titleType: AppBarTitle.text,
          titleTextStyle: AppTextStyle.textTitleAppBar,
          centerTitle: true,
          leadingIcon: IconsUtils.back,
          onLeadingPressed: () {},
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
        body: const Center(
          child: Text(
            'CreateUserView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
