import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/util/number_format_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/material/material_controller.dart';
import 'package:itfsd/app/core/common/input/form_field_widget.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:quickalert/quickalert.dart';

class MoreMaterialView extends BaseView<MaterialController> {
  MoreMaterialView({Key? key, this.idMaterial}) : super(key: key);
  String? idMaterial;

  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: 'Tạo vật tư',
        titleType: AppBarTitle.text,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        centerTitle: true,
        leadingIcon: const Icon(Icons.arrow_back_ios_new),
        onLeadingPressed: () {
          Get.back();
        },
        actions: [
          idMaterial != null
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
                        await controller.deleteDataRequestForm(idMaterial!);
                      },
                    );
                  },
                )
              : const SizedBox()
        ],
      ),
      body: Column(
        children: [
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
                          "Tên vật tư",
                          style: AppTextStyle.textTitleForm,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    FormFieldWidget(
                      controllerEditting: controller.namematerialController,
                      textInputType: TextInputType.text,
                      setValueFunc: controller.setValueNameMaterial,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      "Số lượng",
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    FormFieldWidget(
                        textInputType: TextInputType.number,
                        // suffixIcon: const Icon(Icons.arrow_drop_down),
                        initValue: controller.quantity.toString(),
                        setValueFunc: (value) {
                          controller.quantity.value = int.tryParse(value) ?? 0;
                        }),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      'Ghi chú',
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    FormFieldWidget(
                      textInputType: TextInputType.text,
                      controllerEditting: controller.descriptionController,
                      // suffixIcon: const Icon(Icons.arrow_drop_down),
                      setValueFunc: controller.setValueDescription,
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
                    FormFieldWidget(
                        textInputType: TextInputType.number,
                        // suffixIcon: const Icon(Icons.arrow_drop_down),
                        // initValue: controller.price.toString(),
                        initValue: NumberFormatUtils.formatNumber(
                            controller.price.toInt()),
                        setValueFunc: (value) {
                          controller.price.value = int.tryParse(value) ?? 0;
                        }),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      'Chọn nhóm vật tư',
                      style: AppTextStyle.textTitleForm,
                    ),
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Obx(() {
                      controller.materialGroupId.value;
                      return _viewChooseMaterial(context);
                    }),
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
                    Stack(
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
                                  if (index == controller.listImage.length) {
                                    return SizedBox(
                                      height:
                                          UtilsReponsive.height(context, 150),
                                      width: UtilsReponsive.width(context, 150),
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
                                    height: UtilsReponsive.height(context, 150),
                                    width: UtilsReponsive.width(context, 150),
                                    child: Stack(
                                      children: [
                                        Center(
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
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.white,
                                            child: IconButton(
                                              onPressed: () {
                                                controller
                                                    .onTabDeleteIamge(index);
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
                                          height: UtilsReponsive.height(
                                              context, 90),
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
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Text(
                      'Trạng thái',
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
                              const MaterialStatePropertyAll(Size(20, 60)),
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
                          await controller.createMaterial(idMaterial);
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

  GestureDetector _viewChooseMaterial(
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
                        itemBuilder: (context, index) => Column(
                              children: [
                                ListTile(
                                  trailing: controller.listMaterialid
                                              .value[index].id! ==
                                          controller.materialGroupId.value
                                      ? const Icon(Icons.check)
                                      : null,
                                  onTap: () {
                                    controller.chooseMaterial(
                                        controller.listMaterialid.value[index]);
                                    Get.back();
                                  },
                                  title: Text(controller
                                      .listMaterialid.value[index].name!),
                                ),
                              ],
                            ),
                        separatorBuilder: (context, index) => const Divider(
                              thickness: 1.0,
                            ),
                        itemCount: controller.listMaterialid.value.length),
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
          controllerEditting: controller.materialGroupIdController,
          setValueFunc: () {}),
    );
  }
}
