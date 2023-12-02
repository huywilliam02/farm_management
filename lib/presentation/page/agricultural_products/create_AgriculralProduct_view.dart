import 'dart:io';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/presentation/controllers/agricultural_products/agricultural_products_controller.dart';
import 'package:itfsd/presentation/page/agricultural_products/agricultural_products_view.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/core/common/input/form_field_widget.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:quickalert/quickalert.dart';

class CreateAgriculralProductView
    extends BaseView<AgriculturalProductsController> {
  CreateAgriculralProductView({Key? key, this.idAgriculralProduct})
      : super(key: key);
  String? idAgriculralProduct;

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: UtilsReponsive.height(context, 10),
          ),
          Expanded(
              child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () async {
                  await Get.find<AgriculturalProductsController>()
                      .refeshDataAgriculturalProduct();

                  Get.to(() => const AgriculturalProductsView());
                },
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    'Tạo thu hoạch',
                    style: AppTextStyle.textTitleAppBar,
                  ),
                ),
              ),
              Expanded(
                  child: idAgriculralProduct != null
                      ? IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () async {
                            await QuickAlert.show(
                              context: context,
                              type: QuickAlertType.confirm,
                              title: "Bạn chắc chắn muốn xóa chứ ?",
                              confirmBtnText: "Xác nhận",
                              cancelBtnText: "Hủy bỏ",
                              onConfirmBtnTap: () async {
                                await controller
                                    .deleteDataRequestFormAgriculturalProduct(
                                        idAgriculralProduct!);
                              },
                            );
                          },
                        )
                      : const SizedBox())
            ],
          )),
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Tên hàng hóa",
                          style: AppTextStyle.textTitleForm,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 70),
                      child: FormFieldWidget(
                        controllerEditting:
                            controller.nameAgriculturalProductController,
                        textInputType: TextInputType.text,
                        setValueFunc:
                            controller.setValueNameAgriculturalProduct,
                      ),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      "Giá tiền",
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 70),
                      child: FormFieldWidget(
                          textInputType: TextInputType.number,
                          // suffixIcon: const Icon(Icons.arrow_drop_down),
                          initValue:
                              controller.moneyAgriculturalProduct.toString(),
                          setValueFunc: (value) {
                            controller.moneyAgriculturalProduct.value =
                                int.tryParse(value) ?? 0;
                          }),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Số lượng",
                                    style: AppTextStyle.textTitleForm,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: UtilsReponsive.height(context, 10),
                              ),
                              SizedBox(
                                height: 70,
                                child: FormFieldWidget(
                                    textInputType: TextInputType.text,
                                    controllerEditting: controller
                                        .quantityAgriculturalProductController,
                                    setValueFunc: controller
                                        .setValueQuantityAgriculturalProduct),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: UtilsReponsive.width(context, 30),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Khối lượng",
                                  style: AppTextStyle.textTitleForm,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: UtilsReponsive.height(context, 10),
                            ),
                            SizedBox(
                              height: 70,
                              child: FormFieldWidget(
                                textInputType: TextInputType.text,
                                controllerEditting: controller
                                    .weightAgriculturalProductController,
                                setValueFunc: controller
                                    .setValueWeightAgriculturalProduct,
                              ),
                            )
                          ],
                        )),
                      ],
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      'Chọn doanh nghiệp',
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Obx(() {
                      controller.idFarmChoose.value;
                      return _viewChooseFarm(context);
                    }),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      'Thông tin hàng hóa',
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 70),
                      child: FormFieldWidget(
                        textInputType: TextInputType.text,
                        controllerEditting:
                            controller.informationAgriculturalProductController,
                        setValueFunc:
                            controller.setValueInformationAgriculturalProduct,
                      ),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      "Ngày thực hiện",
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    SizedBox(
                      height: 70,
                      child: GestureDetector(
                        onTap: () async {
                          await controller.chooseDate(true);
                        },
                        child: FormFieldWidget(
                            isEnabled: false,
                            suffixIcon: const Icon(Icons.calendar_month),
                            controllerEditting:
                                controller.timetAgriculturalProductController,
                            setValueFunc: () {}),
                      ),
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      "Chọn hình ảnh",
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    idAgriculralProduct != null
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
                    Text(
                      'Tình trạng',
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Obx(() => DropdownMenu<String>(
                          initialSelection: controller.dropdownValue.value,
                          onSelected: (String? value) {
                            controller.dropdownValue.value = value!;
                          },
                          dropdownMenuEntries: controller.listStatusDropdown
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
                        )),
                    SizedBox(
                      height: UtilsReponsive.height(context, 20),
                    ),
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: context.width),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          minimumSize:
                              const MaterialStatePropertyAll(Size(20, 50)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 40, 127, 60)),
                          // padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                        ),
                        child: const Text(
                          "Xác nhận",
                          style: TextStyleConstant.white16Roboto,
                        ),
                        onPressed: () async {
                          // await controller.createIngredients(idAgriculralProduct);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _viewChooseFarm(
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
                              trailing: controller.listFarm.value[index].id ==
                                      controller.idFarmChoose.value
                                  ? const Icon(Icons.check)
                                  : null,
                              onTap: () {
                                controller.changeFarm(
                                    controller.listFarm.value[index]);
                                Get.back();
                              },
                              title:
                                  Text(controller.listFarm.value[index].name),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: controller.listFarm.value.length),
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
          controllerEditting: controller.farmcontroller,
          setValueFunc: () {}),
    );
  }
}
