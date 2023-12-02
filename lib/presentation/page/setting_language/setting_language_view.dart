import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/base/base_view.dart';

import '../../controllers/setting_language/setting_language_controller.dart';

class SettingLanguageView extends BaseView<SettingLanguageController> {
  const SettingLanguageView({super.key});
  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        title: "Chọn ngôn ngữ",
        titleType: AppBarTitle.text,
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () {
          Get.back();
        },
      ),
      backgroundColor: ColorConstant.background_color,
      body: Obx(
        () => controller.isLoading.isTrue
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        controller.updateLanguage(1);
                      },
                      title: Text("Tiếng việt",
                          style: TextStyleConstant.black16Roboto),
                      leading: Image.asset(
                        "assets/icons/vn.png",
                        height: 30,
                      ),
                      trailing: controller.language.value == "vi"
                          ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : SizedBox.shrink(),
                    ),
                    ListTile(
                      onTap: () {
                        controller.updateLanguage(2);
                      },
                      title: Text("English",
                          style: TextStyleConstant.black16Roboto),
                      leading: Image.asset(
                        "assets/icons/uk.png",
                        height: 30,
                      ),
                      trailing: controller.language.value == "en"
                          ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : SizedBox.shrink(),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
