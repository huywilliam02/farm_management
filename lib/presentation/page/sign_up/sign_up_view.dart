import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/common_app_bar.dart';
import 'package:itfsd/app/core/common/common_form_field_widget.dart';
import 'package:itfsd/app/core/common/common_scaffold.dart';
import 'package:itfsd/app/core/common/form_field_widget.dart';
import 'package:itfsd/app/core/constants/app_constants.dart';
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
        leadingIcon: Icon(Icons.arrow_back_ios_new),
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
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                const Text(
                  "Liên hệ",
                  style: TextStyleConstant.black22RobotoBold,
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonFormFieldWidget(
                  textInputType: TextInputType.text,
                  labelText: "Họ và tên",
                  icon: const Icon(Icons.person_outline_outlined),
                  errorText: controller.erruserNameInput.value,
                  setValueFunc: controller.setNameInput,
                ),
                const SizedBox(
                  height: 16,
                ),
                FormFieldWidget(
                    // initValue: controller.email.value,
                    textInputType: TextInputType.text,
                    icon: const Icon(Icons.home_outlined),
                    errorText: controller.errfullnameInput.value,
                    setValueFunc: controller.setEmailInput),
                const SizedBox(
                  height: 16,
                ),
                FormFieldWidget(
                    // initValue: controller.email.value,
                    textInputType: TextInputType.text,
                    icon: const Icon(Icons.mail_outline_outlined),
                    errorText: controller.errfullnameInput.value,
                    setValueFunc: controller.setEmailInput),
                const SizedBox(
                  height: 16,
                ),
                FormFieldWidget(
                    // initValue: controller.email.value,
                    textInputType: TextInputType.number,
                    icon: const Icon(Icons.phone_in_talk_outlined),
                    errorText: controller.errfullnameInput.value,
                    setValueFunc: controller.setEmailInput),
                const SizedBox(
                  height: 16,
                ),
                FormFieldWidget(
                  textInputType: TextInputType.text,
                  icon: const Icon(Icons.info_outline_rounded),
                  errorText: controller.errfullnameInput.value,
                  setValueFunc: controller.setEmailInput,
                  contentPadding: EdgeInsets.all(10),
                ),
                const SizedBox(
                  height: 16,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: context.width),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          controller.enableButton.isTrue
                              ? Colors.deepPurpleAccent
                              : Colors.grey),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(14)),
                    ),
                    child: const Text(
                      "Đăng ký",
                      style: TextStyleConstant.white16Roboto,
                    ),
                    onPressed: () async {
                      if (controller.enableButton.isTrue) {}
                    },
                  ),
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
