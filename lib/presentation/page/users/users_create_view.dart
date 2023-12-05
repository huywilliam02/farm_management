import 'dart:io';
import 'user.dart';

class CreateUsersView extends BaseView<UsersController> {
  String? userId;

  CreateUsersView({super.key, this.userId});

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
              _buildTextFieldItem(
                title: "Họ và tên",
                obligatory: "*",
                controller: controller.fullnameController,
                setValueFunc: controller.setValueFullName,
                inputType: TextInputType.text,
              ),
              _buildTextFieldItem(
                title: "Tài khoản",
                obligatory: "*",
                controller: controller.usernameController,
                setValueFunc: controller.setValueUserName,
                inputType: TextInputType.text,
              ),
              _buildTextFieldItem(
                title: "Mật khẩu",
                obligatory: "*",
                controller: controller.passwordController,
                setValueFunc: controller.setValuePassword,
                inputType: TextInputType.text,
              ),
              _buildTextFieldItem(
                title: "Email",
                controller: controller.emailController,
                inputType: TextInputType.emailAddress,
                setValueFunc: controller.setValueEmail,
              ),
              _buildTextFieldItem(
                title: "Số điện thoại",
                controller: controller.phoneNumberController,
                inputType: TextInputType.phone,
                setValueFunc: controller.setValuePhoneNumber,
              ),
              _buildTextFieldItem(
                title: "Chức danh",
                controller: controller.jobTitleController,
                inputType: TextInputType.text,
                setValueFunc: controller.setValueJobTitle,
              ),
              _buildTextFieldItem(
                title: "Quê quán",
                controller: controller.homeTownController,
                inputType: TextInputType.text,
                setValueFunc: controller.setValueHomeTown,
              ),
              _buildTextFieldItem(
                title: "Địa chỉ",
                controller: controller.addressController,
                inputType: TextInputType.text,
                setValueFunc: controller.setValueAddress,
              ),
              _buildTextFieldItem(
                title: "Thông tin chung",
                controller: controller.descriptionController,
                inputType: TextInputType.text,
                setValueFunc: controller.setValueDescription,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildDropdownItem(
                    title: "Chọn quyền",
                    listValues: controller.listRoleDropdown,
                    selectedValue: controller.dropdownRoleValue.value,
                    onSelected: (String? value) {
                      controller.dropdownRoleValue.value = value!;
                    },
                  ),
                  _buildDropdownItem(
                    title: "Hoạt động",
                    listValues: controller.listIsLockedDropdown,
                    selectedValue: controller.dropdownIsLockedValue.value,
                    onSelected: (String? value) {
                      controller.dropdownIsLockedValue.value = value!;
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildConstrainBoxButton("Tạo thành viên"),
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
        Get.back();
      },
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return CommonCreateEditItem(
      title: "Hình ảnh",
      widget: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: UtilsReponsive.height(context, 160),
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: UtilsReponsive.height(context, 160),
                  width: double.infinity,
                  child: Obx(() => controller.avatar.isNotEmpty
                      ? _buildImageStack(context)
                      : _buildImagePickerButton(context)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldItem({
    required String title,
    String? obligatory = "",
    required TextEditingController controller,
    required Function(String) setValueFunc,
    TextInputType? inputType,
  }) {
    return CommonCreateEditItem(
      title: title,
      obligatory: obligatory!,
      widget: CommonFormFieldWidget(
        textInputType: inputType ?? TextInputType.text,
        controllerEditting: controller,
        setValueFunc: setValueFunc,
      ),
    );
  }

  Widget _buildDropdownItem({
    required String title,
    required List<String> listValues,
    required String selectedValue,
    void Function(String?)? onSelected,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonCreateEditItem(
          title: title,
          widget: DropdownMenu<String>(
            initialSelection: selectedValue,
            onSelected: onSelected,
            menuStyle: MenuStyle(
              minimumSize: MaterialStateProperty.all(const Size(150, 300)),
            ),
            dropdownMenuEntries:
                listValues.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(
                value: value,
                label: controller.roleLabels[value] ?? value,
                style: MenuItemButton.styleFrom(
                  minimumSize: const Size(20, 50),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildImageStack(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.hardEdge,
      height: UtilsReponsive.height(context, 150),
      width: UtilsReponsive.width(context, 150),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              controller.onImagePick();
            },
            child: Center(
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
                  controller.avatar.value = ""; // Clear the image path
                },
                icon: const Icon(Icons.close),
              ),
            ),
          )
        ],
      ),
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
        controller.avatar.value.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: controller.avatar.value,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        progressIndicatorBuilder: (context, url, progress) =>
            const CircularProgressIndicator(),
        fit: BoxFit.contain,
      );
    } else if (controller.avatar.value != null) {
      return Image.file(
        File(controller.avatar.value),
        fit: BoxFit.contain,
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
