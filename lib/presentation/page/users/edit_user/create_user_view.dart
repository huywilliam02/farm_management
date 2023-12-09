import 'package:itfsd/presentation/page/users/user.dart';
import 'dart:io';

class CreateUsersView extends BaseView<UsersController> {
  CreateUsersView({Key? key, this.userId}) : super(key: key);
  String? userId;

  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildImageSection(context),
              Obx(
                () => _buildTextFieldItem(
                  title: "Họ và tên",
                  obligatory: "*",
                  controller: controller.fullNameController,
                  setValueFunc: controller.setValueFullName,
                  errorText: controller.validateErrFullName.value,
                  inputType: TextInputType.text,
                ),
              ),
              Obx(
                () => _buildTextFieldItem(
                  title: "Tài khoản",
                  obligatory: "*",
                  controller: controller.usernameController,
                  setValueFunc: controller.setValueUserName,
                  errorText: controller.validateErrUserName.value,
                  inputType: TextInputType.text,
                ),
              ),
              Obx(
                () => _buildTextFieldItem(
                  title: "Mật khẩu",
                  obligatory: "*",
                  controller: controller.passwordController,
                  setValueFunc: controller.setValuePassword,
                  errorText: controller.validateErrPassword.value,
                  inputType: TextInputType.text,
                ),
              ),
              _buildTextFieldItem(
                title: "Email",
                controller: controller.emailController,
                inputType: TextInputType.emailAddress,
                setValueFunc: (p0) {},
              ),
              Obx(
                () => _buildTextFieldItem(
                  title: "Số điện thoại",
                  obligatory: "*",
                  controller: controller.phoneNumberController,
                  errorText: controller.validateErrPhone.value,
                  inputType: TextInputType.phone,
                  setValueFunc: controller.setValuePhone,
                ),
              ),
              _buildTextFieldItem(
                title: "Chức danh",
                controller: controller.jobTitleController,
                inputType: TextInputType.text,
                setValueFunc: (p0) {},
              ),
              _buildTextFieldItem(
                title: "Quê quán",
                controller: controller.homeTownController,
                inputType: TextInputType.text,
                setValueFunc: (p0) {},
              ),
              _buildTextFieldItem(
                title: "Địa chỉ",
                controller: controller.addressController,
                inputType: TextInputType.text,
                setValueFunc: (p0) {},
              ),
              _buildTextFieldItem(
                title: "Thông tin chung",
                controller: controller.descriptionController,
                inputType: TextInputType.text,
                setValueFunc: (p0) {},
              ),
              Obx(
                () => _buildCommonDropdown(
                  title: "Chọn quyền",
                  listValues: controller.listRoleDropdown,
                  selectedValue: controller.dropdownRoleValue.value,
                  onSelected: (String? value) {
                    controller.dropdownRoleValue.value = value!;
                  },
                ),
              ),
              // Obx(() => _buildCommonDropdown(
              //       title: "",
              //       listValues: controller.listIsLockedDropdown,
              //       selectedValue: controller.dropdownIsLockedValue.value,
              //       onSelected: (String? value) {
              //         controller.dropdownIsLockedValue.value = value!;
              //       },
              //     )),
              const SizedBox(height: 20),
              _buildConstrainBoxButton(
                "Thêm thành viên",
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CommonAppBar(
      title: "Tạo thành viên",
      titleType: AppBarTitle.text,
      centerTitle: true,
      titleTextStyle: AppTextStyle.textTitleAppBar,
      leadingIcon: IconsUtils.back,
      onLeadingPressed: () {
        Get.toNamed(Routes.USERS);
      },
    );
  }

  Widget _buildTextFieldItem({
    required String title,
    String? obligatory = "",
    required TextEditingController controller,
    required Function(String) setValueFunc,
    TextInputType? inputType,
    String? errorText,
  }) {
    final UsersController usersController = Get.put(UsersController());
    return CommonCreateEditItem(
      title: title,
      obligatory: obligatory!,
      widget: CommonFormFieldWidget(
        textInputType: inputType ?? TextInputType.text,
        controllerEditting: controller,
        setValueFunc: setValueFunc,
        errorText: errorText != "" ? errorText : null,
        onEditingComplete: () {
          if (setValueFunc == usersController.setValueUserName) {
            usersController
                .validateUserName(usersController.usernameController.text);
          } else if (setValueFunc == usersController.setValueFullName) {
            usersController
                .validateFullName(usersController.fullNameController.text);
          } else if (setValueFunc == usersController.setValuePassword) {
            usersController
                .validatePassword(usersController.passwordController.text);
          } else if (setValueFunc == usersController.setValuePhone) {
            usersController
                .validatePhone(usersController.phoneNumberController.text);
          }
        },
      ),
    );
  }

  Widget _buildCommonDropdown({
    required String title,
    required List<String> listValues,
    required String selectedValue,
    required void Function(String?)? onSelected,
  }) {
    return CommonDropdown(
      title: title,
      listValues: listValues,
      selectedValue: selectedValue,
      onSelected: onSelected,
      dropdownLabels: controller.roleLabels,
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return CommonCreateEditItem(
      title: "Hình ảnh",
      widget: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: UtilsReponsive.height(context, 250),
                width: double.infinity,
                child: Obx(() => controller.avatar.isNotEmpty
                    ? _buildImageStack(context)
                    : _buildImagePickerButton(context)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageStack(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            // Handle tap on the single image
            controller.onImagePick();
          },
          child: Container(
            width: double.infinity,
            height: 300,
            child: _getImageWidget(),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {
                // Handle delete for the single image
                controller.avatar.value = ""; // Clear the image path
              },
              icon: const Icon(Icons.close),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildImagePickerButton(BuildContext context) {
    return SizedBox(
      height: UtilsReponsive.height(context, 150),
      width: UtilsReponsive.width(context, 150),
      child: Center(
        child: IconButton(
          onPressed: () {
            controller.onImagePick();
          },
          icon: Image.asset(
            "assets/icons/gallery.png",
            height: UtilsReponsive.height(context, 90),
            width: UtilsReponsive.width(context, 50),
          ),
        ),
      ),
    );
  }

  Widget _getImageWidget() {
    if (controller.avatar.value != null &&
        controller.avatar.value.isNotEmpty &&
        controller.avatar.value.startsWith('http')) {
      return CachedNetworkImage(
        // imageUrl: HttpNetWorkUrlApi.baseURL + controller.avatar.value,
        imageUrl: controller.avatar.value,
        errorWidget: (context, url, error) {
          // Handle the error, e.g., show a placeholder image
          return Image.asset("assets/placeholder_image.png");
        },
        progressIndicatorBuilder: (context, url, progress) {
          if (progress == null) {
            return const CircularProgressIndicator();
          } else {
            return const SizedBox(); // Show a loading indicator
          }
        },
        fit: BoxFit.cover,
      );
    } else if (controller.avatar.value != null &&
        controller.avatar.value.isNotEmpty) {
      return Image.file(
        File(controller.avatar.value),
        fit: BoxFit.cover,
      );
    } else {
      return const Icon(Icons.image, size: 40, color: Colors.grey);
    }
  }

  Widget _buildConstrainBoxButton(String text) {
    return CommonConstrainBoxButton(
      text: text,
      onPressed: () {
        controller.createUser(userId);
      },
    );
  }
}
