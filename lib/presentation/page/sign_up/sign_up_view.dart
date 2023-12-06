import 'sign_up.dart';

class SignUpView extends BaseView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                _buildLogo(),
                Obx(
                  () => _buildFormField(
                    title: "Họ và tên",
                    controller: controller.fullNameController,
                    inputType: TextInputType.text,
                    icon: Icons.person,
                    errorText: controller.validateErrFullName.value,
                    setValueFunc: controller.setFullNameInput,
                  ),
                ),
                Obx(
                  () => _buildFormField(
                    title: "Tên doanh nghiệp",
                    controller: controller.enterpriseController,
                    inputType: TextInputType.text,
                    icon: Icons.house_outlined,
                    errorText: controller.validateErrEnterprise.value,
                    setValueFunc: controller.setEnterpriseInput,
                  ),
                ),
                Obx(
                  () => _buildFormField(
                    title: "Email",
                    controller: controller.emailController,
                    inputType: TextInputType.emailAddress,
                    icon: Icons.email_outlined,
                    errorText: controller.validateErrEmail.value,
                    setValueFunc: controller.setEmailInput,
                  ),
                ),
                Obx(
                  () => _buildFormField(
                    title: "Số điện thoại",
                    controller: controller.phoneController,
                    inputType: TextInputType.phone,
                    icon: Icons.local_phone_outlined,
                    errorText: controller.validateErrPhone.value,
                    setValueFunc: controller.setPhoneInput,
                  ),
                ),
                Obx(
                  () => _buildFormField(
                    title: "Thông tin chung",
                    controller: controller.descriptionController,
                    inputType: TextInputType.text,
                    icon: Icons.error_outline,
                    errorText: controller.validateErrDescription.value,
                    setValueFunc: controller.setDescriptionInput,
                  ),
                ),
                const SizedBox(height: 16),
                CommonConstrainBoxButton(
                  text: 'Đăng ký',
                  onPressed: controller.createContact,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CommonAppBar(
      title: 'Liên hệ',
      titleType: AppBarTitle.text,
      leadingIcon: const Icon(Icons.arrow_back_ios_new),
      titleTextStyle: AppTextStyle.textTitleAppBar,
      centerTitle: true,
      onLeadingPressed: () {
        Get.back();
      },
    );
  }

  Widget _buildLogo() {
    return const Center(
      child: Image(
        image: AssetImage('assets/logo/logo.png'),
        height: 150,
        width: 200,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildFormField({
    required String title,
    required TextEditingController controller,
    required TextInputType inputType,
    required IconData icon,
    required String errorText,
    required Function(String?) setValueFunc,
  }) {
    return CommonCreateEditItem(
      title: title,
      widget: CommonFormFieldWidget(
        controllerEditting: controller,
        textInputType: inputType,
        icon: Icon(icon),
        errorText: errorText,
        setValueFunc: setValueFunc,
      ),
    );
  }
}
