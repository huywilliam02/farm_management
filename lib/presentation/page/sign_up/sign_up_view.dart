import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_constrain_box_button.dart';
import 'package:itfsd/app/core/common/input/common_create_edit_item.dart';
import 'package:itfsd/app/core/common/input/common_form_field_widget.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/common/input/form_field_widget.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/presentation/controllers/sign_up/sign_up_controller.dart';
import '../../../base/base_view.dart';

class SignUpView extends BaseView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Liên hệ",
        titleType: AppBarTitle.text,
        leadingIcon: const Icon(Icons.arrow_back_ios_new),
        titleTextStyle: AppTextStyle.textTitleAppBar,
        centerTitle: true,
        onLeadingPressed: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              children: [
                const Center(
                  child: Image(
                    image: AssetImage("assets/logo/logo.png"),
                    height: 150,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                const Text(
                  "Liên hệ",
                  style: TextStyleConstant.black22RobotoBold,
                ),
                const SizedBox(
                  height: 10,
                ),
                CommonCreateEditItem(
                  title: "Họ và tên",
                  widget: CommonFormFieldWidget(
                    textInputType: TextInputType.text,
                    icon: const Icon(Icons.person_outline_outlined),
                    errorText: controller.erruserNameInput.value,
                    setValueFunc: controller.setNameInput,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CommonCreateEditItem(
                  title: "Tên doanh nghiệp",
                  widget: CommonFormFieldWidget(
                    textInputType: TextInputType.text,
                    icon: const Icon(Icons.maps_home_work_outlined),
                    errorText: controller.erruserNameInput.value,
                    setValueFunc: controller.setNameInput,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CommonCreateEditItem(
                  title: "Email",
                  widget: CommonFormFieldWidget(
                    textInputType: TextInputType.text,
                    labelText: "Email",
                    icon: const Icon(Icons.email_outlined),
                    errorText: controller.erruserNameInput.value,
                    setValueFunc: controller.setNameInput,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CommonCreateEditItem(
                  title: "Số điện thoại",
                  widget: CommonFormFieldWidget(
                    textInputType: TextInputType.number,
                    icon: const Icon(Icons.local_phone_outlined),
                    errorText: controller.erruserNameInput.value,
                    setValueFunc: controller.setNameInput,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CommonCreateEditItem(
                  title: "Thông tin chung",
                  widget: CommonFormFieldWidget(
                    textInputType: TextInputType.text,
                    icon: const Icon(Icons.info_outline),
                    errorText: controller.erruserNameInput.value,
                    setValueFunc: controller.setNameInput,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CommonConstrainBoxButton(
                  text: "Đăng ký",
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
