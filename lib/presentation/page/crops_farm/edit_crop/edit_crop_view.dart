import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/app/core/common/input/common_create_edit_item.dart';
import 'package:itfsd/app/core/common/input/common_form_field_widget.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_constrain_box_button.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/app/util/number_format_utils.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:itfsd/base/base_view.dart';

import '../../../../app/resources/theme/app_text_style.dart';
import '../../../controllers/crops_farm/controllers/edit_crop_controller.dart';

class EditCropView extends BaseView<EditCropController> {
  const EditCropView({
    Key? key,
    this.cropId,
  }) : super(key: key);
  final String? cropId;

  @override
  Widget buildView(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Get.find<EditCropController>().refreshData();
        return true;
      },
      child: CommonScaffold(
        backgroundColor: ColorConstant.background_color,
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCreateEditItem(
                  title: "Tên cây trồng",
                  widget: buildCommonFormFieldWidget(
                    controller: controller.nameController,
                    textInputType: TextInputType.text,
                    setValueFunc: controller.setValueName,
                  ),
                ),
                buildCreateEditItem(
                  title: "Loại bệnh thường gặp",
                  widget: buildCommonFormFieldWidget(
                    controller: controller.diseaseController,
                    textInputType: TextInputType.text,
                    setValueFunc: controller.setValueDisease,
                  ),
                ),
                buildCreateEditItem(
                  title: "Đặc tính sinh trưởng",
                  widget: buildCommonFormFieldWidget(
                    textInputType: TextInputType.text,
                    controller: controller.growthController,
                    setValueFunc: controller.setValueGrowth,
                  ),
                ),
                buildCreateEditItem(
                  title: "Đặc tính sử dụng cây trồng",
                  widget: buildCommonFormFieldWidget(
                    controller: controller.userController,
                    textInputType: TextInputType.text,
                    setValueFunc: controller.setValueUser,
                  ),
                ),
                buildCreateEditItem(
                  title: "Thu hoạch",
                  widget: buildCommonFormFieldWidget(
                    textInputType: TextInputType.text,
                    controller: controller.harvestController,
                    setValueFunc: controller.setValueHarvest,
                  ),
                ),
                buildCreateEditItem(
                  title: "Giá bán giống cây trồng",
                  widget: CommonFormFieldWidget(
                    textInputType: TextInputType.number,
                    controllerEditting: controller.priceController,
                    // initValue: controller.price.toString(),
                    setValueFunc: (value) {
                      controller.price.value = int.tryParse(value) ?? 0;
                    },
                  ),
                ),
                buildCreateEditItem(
                  title: "Nhóm cây trồng",
                  widget: Obx(() {
                    controller.groupCrop.value;
                    controller.groupCropController;
                    return viewChooseProduct(context);
                  }),
                ),
                buildCreateEditItem(
                  title: "Chọn ảnh cây trồng",
                  widget: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: UtilsReponsive.height(context, 160),
                        width: double.infinity,
                        child: Obx(
                          () => ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: UtilsReponsive.width(context, 10),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.listImage.isNotEmpty
                                ? controller.listImage.length + 1
                                : 1,
                            itemBuilder: (context, index) {
                              if (controller.listImage.isNotEmpty) {
                                if (index == controller.listImage.length) {
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
                                          height: UtilsReponsive.height(
                                              context, 90),
                                          width:
                                              UtilsReponsive.width(context, 50),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return SizedBox(
                                  // color: Colors.grey.shade200,
                                  height: UtilsReponsive.height(context, 150),
                                  width: UtilsReponsive.width(context, 150),
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.LIBRARY_IMAGE,
                                              arguments: controller.listImage);
                                        },
                                        child: Center(
                                            child: CachedNetworkImage(
                                          imageUrl:
                                              "http://116.118.49.43:8878${controller.listImage.value[index]}",
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.info),
                                          progressIndicatorBuilder: (context,
                                                  url, progress) =>
                                              const CircularProgressIndicator(),
                                          fit: BoxFit.contain,
                                        )),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.white,
                                          child: IconButton(
                                            onPressed: () {
                                              controller
                                                  .onTabDeleteImage(index);
                                            },
                                            icon: const Icon(Icons.close),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return SizedBox(
                                  height: UtilsReponsive.height(context, 150),
                                  width: UtilsReponsive.width(context, 150),
                                  // decoration: const BoxDecoration(
                                  //   color: Colors.white,
                                  // ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        controller.onImagePick();
                                      },
                                      icon: Image.asset(
                                        "assets/icons/gallery.png",
                                        height:
                                            UtilsReponsive.height(context, 90),
                                        width:
                                            UtilsReponsive.width(context, 50),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // _buildImageSection(context),
                SizedBox(
                  height: UtilsReponsive.height(context, 20),
                ),
                _buildConstrainBoxButton("Thêm cây trồng"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return CommonAppBar(
      title: "Chỉnh sửa cây trồng",
      centerTitle: true,
      titleType: AppBarTitle.text,
      titleTextStyle: AppTextStyle.textTitleAppBar,
      leadingIcon: IconsUtils.back,
      onLeadingPressed: () {
        controller.refreshData();
        Get.back();
      },
      actions: [
        IconButton(
          onPressed: () {
            controller.deleteCrop(cropId!);
          },
          icon: const Icon(IconsUtils.delete),
        ),
      ],
    );
  }

  CommonCreateEditItem buildCreateEditItem(
      {required String title, required Widget widget}) {
    return CommonCreateEditItem(
      title: title,
      widget: widget,
    );
  }

  CommonFormFieldWidget buildCommonFormFieldWidget({
    required TextEditingController controller,
    required TextInputType textInputType,
    required Function(String) setValueFunc,
  }) {
    return CommonFormFieldWidget(
      controllerEditting: controller,
      textInputType: textInputType,
      setValueFunc: setValueFunc,
    );
  }

  GestureDetector viewChooseProduct(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          builder: (context) {
            return SizedBox(
              height: UtilsReponsive.height(context, 300),
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: UtilsReponsive.height(context, 10)),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                        trailing: controller.listgroupCrop.value[index].id! ==
                                controller.groupCrop.value
                            ? const Icon(Icons.check)
                            : null,
                        onTap: () {
                          controller.chooseGroupCrop(
                              controller.listgroupCrop.value[index]);
                          Get.back();
                        },
                        title:
                            Text(controller.listgroupCrop.value[index].name!),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: controller.listgroupCrop.value.length,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: CommonFormFieldWidget(
        isEnabled: false,
        suffixIcon: const Icon(Icons.arrow_drop_down),
        controllerEditting: controller.groupCropController,
        setValueFunc: () {},
      ),
    );
  }

  Widget _buildConstrainBoxButton(String text) {
    return CommonConstrainBoxButton(
      text: text,
      onPressed: () {
        controller.updateCrop(cropId);
      },
    );
  }
}
