import 'package:itfsd/presentation/page/users/user.dart';
import 'dart:io';

class EditUserView extends BaseView<EditUserController> {
  EditUserView({Key? key, this.userId}) : super(key: key);
  String? userId;
  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Chỉnh sửa thành viên",
        titleType: AppBarTitle.text,
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () => Get.back(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          left: 10,
          right: 10,
          top: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonCreateEditItem(
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
                            child: Obx(
                              () => controller.avatar.isNotEmpty
                                  ? buildImageStack(context)
                                  : buildImagePickerButton(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CommonCreateEditItem(
                title: "Họ và tên",
                obligatory: "*",
                widget: CommonFormFieldWidget(
                  textInputType: TextInputType.text,
                  controllerEditting: controller.fullnameController,
                  setValueFunc: controller.setValueFullName,
                ),
              ),
              CommonCreateEditItem(
                title: "Tài khoản",
                obligatory: "*",
                widget: CommonFormFieldWidget(
                  textInputType: TextInputType.text,
                  controllerEditting: controller.usernameController,
                  setValueFunc: controller.setValueUserName,
                ),
              ),
              CommonCreateEditItem(
                title: "Mật khẩu",
                obligatory: "*",
                widget: CommonFormFieldWidget(
                  textInputType: TextInputType.text,
                  controllerEditting: controller.passwordController,
                  setValueFunc: controller.setValuePassword,
                ),
              ),
              CommonCreateEditItem(
                title: "Email",
                widget: CommonFormFieldWidget(
                  textInputType: TextInputType.emailAddress,
                  controllerEditting: controller.emailController,
                  setValueFunc: controller.setValueEmail,
                ),
              ),
              CommonCreateEditItem(
                title: "Số điện thoại",
                widget: CommonFormFieldWidget(
                  textInputType: TextInputType.phone,
                  controllerEditting: controller.phoneNumberController,
                  setValueFunc: controller.setValuePhoneNumber,
                ),
              ),
              CommonCreateEditItem(
                title: "Chức danh",
                widget: CommonFormFieldWidget(
                  textInputType: TextInputType.text,
                  controllerEditting: controller.jobTitleController,
                  setValueFunc: controller.setValueJobTitle,
                ),
              ),
              CommonCreateEditItem(
                title: "Quê quán",
                widget: CommonFormFieldWidget(
                  textInputType: TextInputType.text,
                  controllerEditting: controller.homeTownController,
                  setValueFunc: controller.setValueHomeTown,
                ),
              ),
              CommonCreateEditItem(
                title: "Địa chỉ",
                widget: CommonFormFieldWidget(
                  textInputType: TextInputType.text,
                  controllerEditting: controller.addressController,
                  setValueFunc: controller.setValueAddress,
                ),
              ),
              CommonCreateEditItem(
                title: "Thông tin chung",
                widget: SizedBox(
                  child: CommonFormFieldWidget(
                    textInputType: TextInputType.text,
                    controllerEditting: controller.descriptionController,
                    setValueFunc: controller.setValueDescription,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CommonCreateEditItem(
                    title: "Chọn quyền",
                    widget: Obx(() => DropdownMenu<String>(
                          initialSelection: controller.dropdownRoleValue.value,
                          onSelected: (String? value) {
                            controller.dropdownRoleValue.value = value!;
                          },
                          dropdownMenuEntries: controller.listRoleDropdown
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                              value: value,
                              label: controller.roleLabels[value] ?? value,
                              style: MenuItemButton.styleFrom(
                                minimumSize: Size(10, 30),
                              ),
                            );
                          }).toList(),
                        )),
                  ),
                  CommonCreateEditItem(
                    title: "Hoạt động",
                    widget: Obx(() => DropdownMenu<String>(
                          initialSelection:
                              controller.dropdownIsLockedValue.value,
                          onSelected: (String? value) {
                            controller.dropdownIsLockedValue.value = value!;
                          },
                          dropdownMenuEntries: controller.listIsLockedDropdown
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                              value: value,
                              label: value,
                            );
                          }).toList(),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CommonConstrainBoxButton(
                text: "Tạo thành viên",
                onPressed: () {
                  controller.createUser(userId);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageStack(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.hardEdge,
      height: UtilsReponsive.height(context, 150),
      width: UtilsReponsive.width(context, 150),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              // Handle tap on the single image
            },
            child: Center(
              child: getImageWidget(),
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
      ),
    );
  }

  Widget buildImagePickerButton(BuildContext context) {
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

  Widget getImageWidget() {
    if (controller.avatar.value != null &&
        controller.avatar.value.startsWith('http')) {
      // If the avatar is a URL
      return CachedNetworkImage(
        imageUrl: controller.avatar.value,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        progressIndicatorBuilder: (context, url, progress) =>
            const CircularProgressIndicator(),
        fit: BoxFit.contain,
      );
    } else if (controller.avatar.value != null) {
      // If the avatar is a local file path
      return Image.file(
        File(controller.avatar.value),
        fit: BoxFit.contain,
      );
    } else {
      // Handle the case where avatar.value is null
      return const Icon(Icons.image, size: 40, color: Colors.grey);
    }
  }
}
