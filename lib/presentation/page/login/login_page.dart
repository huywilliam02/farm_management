import 'package:itfsd/app/core/common/common_app_bar.dart';
import 'package:itfsd/app/core/common/common_scaffold.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/presentation/controllers/login/login_controller.dart';
import 'package:itfsd/presentation/page/login/widgets/custom_form_field.dart';
import '../../../../base/base_view.dart';

class LoginPage extends BaseView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget buildView(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          controller.onBackLoginPage();
          return true;
        },
        child: controller.isLoading.isTrue
            ? const CommonLoadingPageProgressIndicator()
            : CommonScaffold(
                appBar: CommonAppBar(
                  backgroundColor: Colors.green,
                  title: "Đăng nhập",
                  titleTextStyle: AppTextStyle.textTitleAppBar,
                  centerTitle: true,
                  titleType: AppBarTitle.text,
                  leadingIcon: const Icon(Icons.arrow_back_ios_new),
                  onLeadingPressed: () {},
                ),
                body: SafeArea(
                  child: Container(
                    margin: const EdgeInsets.only(top: 60, left: 16, right: 16),
                    width: context.width,
                    height: context.height,
                    child: SingleChildScrollView(
                      child: Form(
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
                            SizedBox(
                              height: UtilsReponsive.height(context, 20),
                            ),
                            const Text(
                              "Đăng nhập",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black87),
                            ),
                            SizedBox(
                              height: UtilsReponsive.height(context, 20),
                            ),
                            Obx(
                              () => CustomFormFieldWidget(
                                controllerEditting:
                                    controller.usernameController,
                                textInputType: TextInputType.text,
                                icon: const Icon(Icons.person),
                                labelText: 'Tên đăng nhập',
                                errorText: controller.validateErrusername.value,
                                setValueFunc: controller.setUserNameInput,
                              ),

                              // validation: (String? value) {
                              //   if (value == null || value.isEmpty) {
                              //     return "This field can't be empty";
                              //   } else if (!value.isValidEmail) {
                              //     return "Please enter valid email";
                              //   }
                              //   return null;
                              // },
                            ),
                            SizedBox(
                              height: UtilsReponsive.height(context, 20),
                            ),
                            Obx(
                              () => CustomFormFieldWidget(
                                  isObscureText: controller.checkpassword.value,
                                  suffixIcon: IconButton(
                                    icon: Icon(controller.checkpassword.value
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      controller.checkpassword.value =
                                          !controller.checkpassword.value;
                                    },
                                  ),
                                  icon: const Icon(Icons.lock),
                                  textInputType: TextInputType.text,
                                  controllerEditting:
                                      controller.passwordController,
                                  // focusNode: controller.focusPassword,
                                  errorText:
                                      controller.validateErrPassword.value,
                                  labelText: "Mật khẩu",
                                  setValueFunc: controller.setValuePassword),
                            ),
                            TextButton(
                              onPressed: () async {
                                // Get.toNamed(Routes.FORGET_PASSWORD);
                              },
                              child: const Text("Lấy lại mật khẩu"),
                            ),
                            SizedBox(
                              height: UtilsReponsive.height(context, 10),
                            ),
                            Obx(
                              () => ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    width: context.width),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    minimumSize: const MaterialStatePropertyAll(
                                        Size(20, 60)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        controller.username.value != "" &&
                                                controller.password.value !=
                                                    "" &&
                                                controller.validateErrusername
                                                    .isEmpty &&
                                                controller
                                                    .validateErrPassword.isEmpty
                                            ? Colors.deepPurpleAccent
                                            : Colors.green),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(14)),
                                  ),
                                  child: Text(
                                    "Đăng Nhập",
                                    style: AppTextStyle.textButton,
                                  ),
                                  onPressed: () async {
                                    await controller.login();
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: UtilsReponsive.height(context, 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
  }
}
