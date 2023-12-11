import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/components/custom_gesture_detector.dart';
import 'package:itfsd/app/core/common/input/common_form_field_widget.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/requestform/request_form_controller.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:quickalert/quickalert.dart';

import '../../../app/core/common/input/form_field_widget.dart';

class RequestformView extends BaseView<RequestformController> {
  RequestformView({Key? key, this.idrequestform}) : super(key: key);
  String? idrequestform;
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.background_color,
        appBar: CommonAppBar(
          title: 'Tạo phiếu yêu cầu',
          titleType: AppBarTitle.text,
          titleTextStyle: AppTextStyle.textTitleAppBar,
          centerTitle: true,
          leadingIcon: const Icon(Icons.arrow_back_ios_new),
          onLeadingPressed: () async {
            Get.back();
          },
          actions: [
            idrequestform != null
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
                              .deleteDataRequestForm(idrequestform!);
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Lý do",
                                style: AppTextStyle.textTitleForm,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          CommonFormFieldWidget(
                            textInputType: TextInputType.text,
                            controllerEditting: controller.nameController,
                            setValueFunc: controller.setValueName,
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          Text(
                            'Tên vật tư',
                            style: AppTextStyle.textTitleForm,
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          // Obx(() {
                          //   controller.idmaterialChoose.value;
                          //   return _viewChooseMaterial(context);
                          // }),

                          Obx(() {
                            return CustomGestureDetector(
                              context: context,
                              setValueFunc: () {},
                              isEnabled: false,
                              controllerEditting:
                                  controller.idmaterialChooseController,
                              // idName: idrequestform,
                              items: controller.listMaterialRequestform,
                              displayFunction: (material) =>
                                  material.name ?? 'Unknown Material',
                              icon: const Icon(Icons.arrow_forward_ios),
                              itemCount:
                                  controller.listMaterialRequestform.length,
                              onPressed: (selectedMaterial) {
                                // Kiểm tra giá trị được chọn khi nhấn vào
                                print('Selected Material: $selectedMaterial');
                                controller.chooseMaterial(selectedMaterial);
                                Get.back();
                              },
                            );
                          }),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          Text(
                            'Số lượng',
                            style: AppTextStyle.textTitleForm,
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          CommonFormFieldWidget(
                              initValue: controller.quantity.toString(),
                              textInputType: TextInputType.number,
                              setValueFunc: (value) {
                                controller.quantity.value =
                                    int.tryParse(value) ?? 0;
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
                          CommonFormFieldWidget(
                            textInputType: TextInputType.text,
                            controllerEditting:
                                controller.descriptionController,
                            setValueFunc: controller.setValueDescription,
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          Text(
                            'Nhà cung cấp',
                            style: AppTextStyle.textTitleForm,
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(context, 10),
                          ),
                          Obx(() {
                            controller.idproviderChoose.value;
                            return _viewChooseProvider(context);
                          }),
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
                                initialSelection:
                                    controller.dropdownValue.value,
                                onSelected: (String? value) {
                                  controller.dropdownValue.value = value!;
                                },
                                dropdownMenuEntries: controller
                                    .listStatusDropdown
                                    .map<DropdownMenuEntry<String>>(
                                        (String value) {
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
                                minimumSize: const MaterialStatePropertyAll(
                                    Size(20, 50)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 40, 127, 60)),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                              ),
                              child: Text(
                                idrequestform != null
                                    ? "Cập nhật"
                                    : "Tạo phiếu",
                                style: TextStyleConstant.white16Roboto,
                              ),
                              onPressed: () async {
                                await controller
                                    .createRequestForm(idrequestform);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
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
                        itemBuilder: (context, index) => ListTile(
                              trailing: controller.listMaterialRequestform
                                          .value[index].id ==
                                      controller.idmaterialChoose.value
                                  ? const Icon(Icons.check)
                                  : null,
                              onTap: () {
                                controller.chooseMaterial(controller
                                    .listMaterialRequestform.value[index]);
                                Get.back();
                              },
                              title: Text(controller
                                  .listMaterialRequestform.value[index].name),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount:
                            controller.listMaterialRequestform.value.length),
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
          controllerEditting: controller.idmaterialChooseController,
          setValueFunc: () {}),
    );
  }

  GestureDetector _viewChooseProvider(
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
                              trailing: controller.listSupplierRequestform
                                          .value[index].id ==
                                      controller.idproviderChoose.value
                                  ? const Icon(Icons.check)
                                  : null,
                              onTap: () {
                                controller.chooseSupplier(controller
                                    .listSupplierRequestform.value[index]);
                                Get.back();
                              },
                              title: Text(controller
                                  .listSupplierRequestform.value[index].name),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount:
                            controller.listSupplierRequestform.value.length),
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
          controllerEditting: controller.idproviderChooseController,
          setValueFunc: () {}),
    );
  }
}
