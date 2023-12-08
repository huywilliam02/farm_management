import 'package:flutter/material.dart';

import 'login.dart';
import 'package:itfsd/app/util/string_extention.dart';

class LoginPage extends BaseView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

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
              appBar: _buildAppBar(),
              body: SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(top: 60, left: 16, right: 16),
                  width: context.width,
                  height: context.height,
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        children: [
                          _buildLogo(),
                          SizedBox(
                            height: UtilsReponsive.height(context, 20),
                          ),
                          const Text(
                            "Đăng nhập",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black87),
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 20),
                          ),
                          _buildUsernameFormField(),
                          SizedBox(
                            height: UtilsReponsive.height(context, 20),
                          ),
                          _buildPasswordFormField(),
                          TextButton(
                            onPressed: () async {
                              // Get.toNamed(Routes.FORGET_PASSWORD);
                            },
                            child: const Text("Lấy lại mật khẩu"),
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          _buildLoginButton(context),
                          SizedBox(
                            height: UtilsReponsive.height(context, 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CommonAppBar(
      backgroundColor: Colors.green,
      title: "Đăng nhập",
      titleTextStyle: AppTextStyle.textTitleAppBar,
      centerTitle: true,
      titleType: AppBarTitle.text,
      leadingIcon: const Icon(Icons.arrow_back_ios_new),
      onLeadingPressed: () {
        controller.onBackLoginPage();
        Get.to(() => LoginChoosePage());
      },
    );
  }

  Widget _buildLogo() {
    return const Center(
      child: Image(
        image: AssetImage("assets/logo/logo.png"),
        height: 200,
        width: 200,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildUsernameFormField() {
    return Obx(
      () => CommonFormFieldWidget(
        controllerEditting: controller.usernameController,
        textInputType: TextInputType.text,
        icon: const Icon(Icons.person),
        labelText: 'Tên đăng nhập',
        errorText: controller.validateErrusername.value,
        setValueFunc: controller.setUserNameInput,
      ),
    );
  }

  Widget _buildPasswordFormField() {
    return Obx(
      () => CommonFormFieldWidget(
        isObscureText: controller.checkpassword.value,
        suffixIcon: IconButton(
          icon: Icon(
            controller.checkpassword.value
                ? Icons.visibility_off
                : Icons.visibility,
          ),
          onPressed: () {
            controller.checkpassword.value = !controller.checkpassword.value;
          },
        ),
        icon: const Icon(Icons.lock),
        textInputType: TextInputType.text,
        controllerEditting: controller.passwordController,
        errorText: controller.validateErrPassword.value,
        labelText: "Mật khẩu",
        setValueFunc: controller.setValuePassword,
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Obx(
      () => ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: context.width),
        child: ElevatedButton(
          style: ButtonStyle(
            minimumSize: const MaterialStatePropertyAll(Size(20, 60)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              controller.username.value != "" &&
                      controller.password.value != "" &&
                      controller.validateErrusername.isEmpty &&
                      controller.validateErrPassword.isEmpty
                  ? Colors.deepPurpleAccent
                  : Colors.green,
            ),
            padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
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
    );
  }
}
