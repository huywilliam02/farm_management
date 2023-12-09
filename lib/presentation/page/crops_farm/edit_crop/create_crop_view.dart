import 'dart:io';

import 'package:itfsd/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/crops_farm/controllers/crops_farm_controller.dart';
import 'package:itfsd/app/core/common/input/form_field_widget.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:quickalert/quickalert.dart';

class CreateCropView extends BaseView<CropsFarmController> {
  CreateCropView({Key? key, this.idtree}) : super(key: key);
  String? idtree;
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Get.back();
                },
              )),
              Expanded(
                  flex: 3,
                  child: Center(
                      child: Text(
                    'Thêm cây trồng',
                    style: AppTextStyle.textTitleAppBar,
                  ))),
              Expanded(
                  child: idtree != null
                      ? IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () async {
                            await QuickAlert.show(
                              context: context,
                              type: QuickAlertType.confirm,
                              title: "Bạn chắc chưa",
                              confirmBtnText: "OK",
                              cancelBtnText: "Chưa",
                              onConfirmBtnTap: () async {
                                await controller.deleteData(idtree!);
                              },
                            );
                          },
                        )
                      : const SizedBox()),
            ],
          )),
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tên cây trồng",
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 70),
                      child: FormFieldWidget(
                        controllerEditting: controller.nameController,
                        textInputType: TextInputType.text,
                        setValueFunc: controller.setValueName,
                      ),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      "Loại bệnh thường gặp",
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 70),
                      child: FormFieldWidget(
                        controllerEditting: controller.diseaseController,
                        textInputType: TextInputType.text,
                        setValueFunc: controller.setValueDisease,
                      ),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      'Đặc tính sinh trưởng',
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 70),
                      child: FormFieldWidget(
                        textInputType: TextInputType.text,
                        controllerEditting: controller.growthController,
                        setValueFunc: controller.setValueGrowth,
                      ),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      "Đặc tính sử dụng cây trồng",
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 70),
                      child: FormFieldWidget(
                        controllerEditting: controller.userController,
                        textInputType: TextInputType.text,
                        setValueFunc: controller.setValueUser,
                      ),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      'Thu hoạch',
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 70),
                      child: FormFieldWidget(
                        textInputType: TextInputType.text,
                        controllerEditting: controller.harvestController,
                        setValueFunc: controller.setValueHarvest,
                      ),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      'Giá bán giống cây trồng',
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 70),
                      child: FormFieldWidget(
                          // initValue: controller.price.toString(),
                          textInputType: TextInputType.number,
                          controllerEditting: controller.priceController,
                          setValueFunc: (value) {
                            controller.price.value = int.tryParse(value) ?? 0;
                          }),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      'Nhóm cây trồng',
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Obx(() {
                      controller.groupCrop.value;
                      return _viewChooseProduct(context);
                    }),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      'Chọn ảnh cây trồng',
                      style: AppTextStyle.textTitleForm,
                    ),
                    idtree != null
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: UtilsReponsive.height(context, 160),
                                width: double.infinity,
                                child: Obx(
                                  () => ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        width:
                                            UtilsReponsive.width(context, 10),
                                      );
                                    },
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.listImage.isNotEmpty
                                        ? controller.listImage.length + 1
                                        : 1,
                                    itemBuilder: (context, index) {
                                      if (controller.listImage.isNotEmpty) {
                                        if (index ==
                                            controller.listImage.length) {
                                          return SizedBox(
                                            height: UtilsReponsive.height(
                                                context, 150),
                                            width: UtilsReponsive.width(
                                                context, 150),
                                            child: Center(
                                              child: IconButton(
                                                onPressed: () {
                                                  controller.onImagePick();
                                                },
                                                icon: Image.asset(
                                                  "assets/icons/gallery.png",
                                                  height: UtilsReponsive.height(
                                                      context, 90),
                                                  width: UtilsReponsive.width(
                                                      context, 50),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        return SizedBox(
                                          // color: Colors.grey.shade200,
                                          height: UtilsReponsive.height(
                                              context, 150),
                                          width: UtilsReponsive.width(
                                              context, 150),
                                          child: Stack(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(
                                                      Routes.LIBRARY_IMAGE,
                                                      arguments:
                                                          controller.listImage);
                                                },
                                                child: Center(
                                                    child: CachedNetworkImage(
                                                  imageUrl:
                                                      "http://116.118.49.43:8878${controller.listImage.value[index]}",
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.info),
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              progress) =>
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
                                                          .onTabDeleteIamge(
                                                              index);
                                                    },
                                                    icon:
                                                        const Icon(Icons.close),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      } else {
                                        return SizedBox(
                                          height: UtilsReponsive.height(
                                              context, 150),
                                          width: UtilsReponsive.width(
                                              context, 150),
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
                                                height: UtilsReponsive.height(
                                                    context, 90),
                                                width: UtilsReponsive.width(
                                                    context, 50),
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
                          )
                        : Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: UtilsReponsive.height(context, 160),
                                width: double.infinity,
                                child: Obx(
                                  () => ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        width: 10,
                                      );
                                    },
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.listImage.isNotEmpty
                                        ? controller.listImage.length + 1
                                        : 1,
                                    itemBuilder: (context, index) {
                                      if (controller.listImage.isNotEmpty) {
                                        if (index ==
                                            controller.listImage.length) {
                                          return SizedBox(
                                            height: UtilsReponsive.height(
                                                context, 150),
                                            width: UtilsReponsive.width(
                                                context, 150),
                                            // decoration: BoxDecoration(
                                            //     // color: Colors.white,
                                            //     // border: Border.all(width: 3),
                                            //     ),
                                            child: Center(
                                              child: IconButton(
                                                onPressed: () {
                                                  controller.onImagePick();
                                                },
                                                icon: Image.asset(
                                                  "assets/icons/gallery.png",
                                                  height: 90,
                                                  width: 50,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        return SizedBox(
                                          // color: Colors.grey.shade200,
                                          height: UtilsReponsive.height(
                                              context, 150),
                                          width: UtilsReponsive.width(
                                              context, 150),
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Image.file(
                                                  File(controller
                                                      .listImage[index]),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: Colors.white,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      controller
                                                          .onTabDeleteIamge(
                                                              index);
                                                    },
                                                    icon:
                                                        const Icon(Icons.close),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      } else {
                                        return SizedBox(
                                          height: UtilsReponsive.height(
                                              context, 150),
                                          width: UtilsReponsive.width(
                                              context, 150),
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
                                                height: UtilsReponsive.height(
                                                    context, 90),
                                                width: UtilsReponsive.width(
                                                    context, 50),
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
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: const Size(120, 50),
                          ),
                          child: const Text("Hủy bỏ"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            minimumSize: const Size(120, 50),
                          ),
                          onPressed: () async {
                            controller.createCropsfarm(idtree);
                          },
                          child: Text(
                            idtree != null ? "Cập nhật" : "Xác nhận",
                            style: TextStyleConstant.white16Roboto,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  GestureDetector _viewChooseProduct(
    BuildContext context,
  ) {
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
                  SizedBox(
                    height: UtilsReponsive.height(context, 10),
                  ),
                  Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListTile(
                              trailing:
                                  controller.listgroupCrop.value[index].id! ==
                                          controller.groupCrop.value
                                      ? const Icon(Icons.check)
                                      : null,
                              onTap: () {
                                controller.chooseGroupCrop(
                                    controller.listgroupCrop.value[index]);
                                Get.back();
                              },
                              title: Text(
                                  controller.listgroupCrop.value[index].name!),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: controller.listgroupCrop.value.length),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: FormFieldWidget(
          isEnabled: false,
          suffixIcon: const Icon(Icons.arrow_drop_down),
          controllerEditting: controller.groupCropController,
          setValueFunc: () {}),
    );
  }
}
