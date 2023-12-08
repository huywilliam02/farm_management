import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/app/core/common/input/common_drop_down.dart';
import 'package:itfsd/app/core/common/input/common_form_field_widget.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_constrain_box_button.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/common/input/form_field_widget.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:flutter/material.dart';

import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:itfsd/app/core/common/input/common_create_edit_item.dart';
import 'package:itfsd/presentation/controllers/account/controllers/account_controller.dart';
import 'package:itfsd/presentation/controllers/login/login_controller.dart';
import '../../controllers/edit_profile/edit_profile_controller.dart';
import '../../controllers/users/users_controller.dart';

class EditProfileView extends BaseView<EditProfileController> {
  const EditProfileView({Key? key, this.userId}) : super(key: key);
  final String? userId;
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
              const SizedBox(height: 20),
              _buildConstrainBoxButton(
                "Lưu",
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CommonAppBar(
      title: "Chỉnh sửa trang cá nhân",
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

  // Widget _buildCommonDropdown({
  //   required String title,
  //   required List<String> listValues,
  //   required String selectedValue,
  //   required void Function(String?)? onSelected,
  // }) {
  //   return CommonDropdown(
  //     title: title,
  //     listValues: listValues,
  //     selectedValue: selectedValue,
  //     onSelected: onSelected,
  //     dropdownLabels: controller.roleLabels,
  //   );
  // }

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
        imageUrl: HttpNetWorkUrlApi.baseURL + controller.avatar.value,
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
        // controller.createUser(userId);
      },
    );
  }
}
