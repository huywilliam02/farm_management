import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/core/common/input/form_field_widget.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../presentation/controllers/farming_calendar/farming_calendar_controller.dart';
import 'view-all-schedule.dart';

class FarmingCalendarView extends BaseView<FarmingCalendarController> {
  FarmingCalendarView({Key? key, this.idDetail}) : super(key: key);
  String? idDetail;
  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title:
            idDetail != null ? "Chi tiết lịch canh tác" : "Tạo lịch canh tác",
        titleType: AppBarTitle.text,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        centerTitle: true,
        leadingIcon: const Icon(Icons.arrow_back_ios_new),
        onLeadingPressed: () async {
          Get.to(() => const ViewAllSchedule());
        },
        actions: [
          idDetail != null
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
                        await controller.deleteData(idDetail!);
                      },
                    );
                  },
                )
              : const SizedBox()
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15,),
          Expanded(
            flex: 8,
            child: Obx(
              () => controller.isLoading.value
                  ? const CommonLoadingPageProgressIndicator()
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chọn vùng canh tác',
                              style: AppTextStyle.textTitleForm,
                            ),
                            SizedBox(
                              height: UtilsReponsive.height(context, 10),
                            ),
                            Obx(() {
                              controller.idLandChoose.value;
                              return _viewChooseLandDivision(context);
                            }),
                            SizedBox(
                              height: UtilsReponsive.height(context, 10),
                            ),
                            Text(
                              'Loại sản phẩm',
                              style: AppTextStyle.textTitleForm,
                            ),
                            SizedBox(
                              height: UtilsReponsive.height(context, 10),
                            ),
                            Obx(() {
                              controller.idproductnameChoose.value;
                              return _viewChooseProduct(context);
                            }),
                            SizedBox(
                              height: UtilsReponsive.height(context, 10),
                            ),
                            Text(
                              'Tên sản phẩm',
                              style: AppTextStyle.textTitleForm,
                            ),
                            SizedBox(
                              height: UtilsReponsive.height(context, 10),
                            ),
                            FormFieldWidget(
                              controllerEditting: controller.nameController,
                              textInputType: TextInputType.text,
                              setValueFunc: controller.setValueNameProduct,
                            ),
                            SizedBox(
                              height: UtilsReponsive.height(context, 10),
                            ),
                            Text(
                              'Số lượng giống',
                              style: AppTextStyle.textTitleForm,
                            ),
                            SizedBox(
                              height: UtilsReponsive.height(context, 10),
                            ),
                            FormFieldWidget(
                              initValue:
                                  controller.numberOfVarites.toString(),
                              // controllerEditting:
                              //     controller.numberOfVaritesController,
                              textInputType: TextInputType.number,
                              setValueFunc: (value) {
                                controller.numberOfVarites.value =
                                    int.tryParse(value) ?? 0;
                              },
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
                                            "Ngày bắt đầu",
                                            style: AppTextStyle.textTitleForm,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: UtilsReponsive.height(
                                            context, 10),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await controller.chooseDate(true);
                                        },
                                        child: FormFieldWidget(
                                            isEnabled: false,
                                            suffixIcon: const Icon(
                                                Icons.calendar_month),
                                            controllerEditting: controller
                                                .dateStartController,
                                            setValueFunc: () {}),
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
                                          "Ngày thu hoạch",
                                          style: AppTextStyle.textTitleForm,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          UtilsReponsive.height(context, 10),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await controller.chooseDate(false);
                                      },
                                      child: FormFieldWidget(
                                          isEnabled: false,
                                          suffixIcon: const Icon(
                                              Icons.calendar_month),
                                          controllerEditting:
                                              controller.dateEndController,
                                          setValueFunc: () {}),
                                    )
                                  ],
                                )),
                              ],
                            ),
                            SizedBox(
                              height: UtilsReponsive.height(context, 10),
                            ),
                            Text(
                              'Đơn vị cấp giống',
                              style: AppTextStyle.textTitleForm,
                            ),
                            SizedBox(
                              height: UtilsReponsive.height(context, 10),
                            ),
                            FormFieldWidget(
                                controllerEditting:
                                    controller.seedProviderController,
                                textInputType: TextInputType.text,
                                setValueFunc:
                                    controller.setValueseedProvider),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sản lượng dự kiến",
                                          style: AppTextStyle.textTitleForm,
                                        ),
                                        SizedBox(
                                          height: UtilsReponsive.height(
                                              context, 10),
                                        ),
                                        FormFieldWidget(
                                            initValue: controller
                                                .expectOutput
                                                .toString(),
                                            // controllerEditting: controller
                                            //     .expectOutputController,
                                            textInputType:
                                                TextInputType.number,
                                            setValueFunc: (value) {
                                              controller
                                                      .expectOutput.value =
                                                  int.tryParse(value) ?? 0;
                                            }),
                                      ],
                                    )),
                                SizedBox(
                                  width: UtilsReponsive.width(context, 20),
                                ),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Đơn vị tính",
                                          style: AppTextStyle.textTitleForm,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          UtilsReponsive.height(context, 10),
                                    ),
                                    SizedBox(
                                      height: 70,
                                      child: Obx(() {
                                        controller.unitChoose.value;
                                        return _viewChooseUnit(context);
                                      }),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                            SizedBox(
                              height: UtilsReponsive.height(context, 10),
                            ),
                            Text(
                              'Người thực hiện',
                              style: AppTextStyle.textTitleForm,
                            ),
                            SizedBox(
                              height: UtilsReponsive.height(context, 10),
                            ),
                            Obx(() {
                              controller.unitChoose.value;
                              return _viewChooseUser(context);
                            }),
                            SizedBox(
                              height: UtilsReponsive.height(context, 20),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: context.width),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  minimumSize: const MaterialStatePropertyAll(
                                      Size(20, 60)),
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
                                  idDetail != null
                                      ? "Cập nhật dữ liệu"
                                      : "Tạo lịch canh tác",
                                  style: TextStyleConstant.white16Roboto,
                                ),
                                onPressed: () async {
                                  await controller.createSchedule(idDetail);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _viewChooseLandDivision(BuildContext context) {
    return GestureDetector(
      onTap: () {
        idDetail != null
            ? null
            : showModalBottomSheet(
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
                                        trailing: controller
                                                    .listLand.value[index].id ==
                                                controller.idLandChoose.value
                                            ? const Icon(Icons.check)
                                            : null,
                                        onTap: () {
                                          controller.chooseLand(
                                              controller.listLand.value[index]);
                                          Get.back();
                                        },
                                        title: Text(controller
                                            .listLand.value[index].name!),
                                      ),
                                    ],
                                  ),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                    thickness: 1.0,
                                  ),
                              itemCount: controller.listLand.value.length),
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
          controllerEditting: controller.landController,
          setValueFunc: () {}),
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
                        itemBuilder: (context, index) => Column(
                              children: [
                                ListTile(
                                  trailing: controller
                                              .listProduct.value[index].id! ==
                                          controller.idproductnameChoose.value
                                      ? const Icon(Icons.check)
                                      : null,
                                  onTap: () {
                                    controller.chooseProduct(
                                        controller.listProduct.value[index]);
                                    Get.back();
                                  },
                                  title: Text(controller
                                      .listProduct.value[index].name!),
                                ),
                              ],
                            ),
                        separatorBuilder: (context, index) => const Divider(
                              thickness: 1.0,
                            ),
                        itemCount: controller.listProduct.value.length),
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
          controllerEditting: controller.productController,
          setValueFunc: () {}),
    );
  }

  GestureDetector _viewChooseUnit(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          context: context,
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
                                  trailing: controller
                                              .listUnit.value[index].name! ==
                                          controller.idproductnameChoose.value
                                      ? const Icon(Icons.check)
                                      : null,
                                  onTap: () {
                                    controller.chooseUnit(
                                        controller.listUnit.value[index].name!);
                                    Get.back();
                                  },
                                  title: Text(
                                      controller.listUnit.value[index].name!),
                                ),
                              ],
                            ),
                        separatorBuilder: (context, index) => const Divider(
                              thickness: 1.0,
                            ),
                        itemCount: controller.listUnit.value.length),
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
          controllerEditting: controller.unitController,
          setValueFunc: () {}),
    );
  }

  GestureDetector _viewChooseUser(
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
            return StatefulBuilder(
              builder: (context, setState) => Container(
                padding: const EdgeInsets.all(10),
                height: UtilsReponsive.height(context, 300),
                width: double.infinity,
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: UtilsReponsive.height(context, 10),
                    // ),
                    Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Column(
                                children: [
                                  ListTile(
                                    trailing: controller.listIdUserChoose
                                            .contains(controller
                                                .listUser.value[index].id!)
                                        ? const Icon(Icons.check_box)
                                        : const Icon(
                                            Icons.check_box_outline_blank),
                                    onTap: () {
                                      controller.chooseUser(
                                          controller.listUser.value[index].id!);
                                      setState(() {});
                                    },
                                    title: Text(controller
                                        .listUser.value[index].fullName!),
                                  ),
                                ],
                              ),
                          separatorBuilder: (context, index) => const Divider(
                                thickness: 1.0,
                              ),
                          itemCount: controller.listUser.value.length),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: FormFieldWidget(
          isEnabled: false,
          suffixIcon: const Icon(Icons.arrow_drop_down),
          controllerEditting: controller.userController,
          setValueFunc: () {}),
    );
  }
//   Center _dropDownLandivision(BuildContext context, List<LandDivision> items) {
//     items.add(LandDivision(id: "12",name: "hihi"));
//     Rx<LandDivision> valueSelected = Rx<LandDivision>(items.first);
//     return Center(
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2<LandDivision>(
//           isExpanded: true,
//           hint: Text(
//             'Select Item',
//             style: TextStyle(
//               fontSize: 14,
//               color: Theme.of(context).hintColor,
//             ),
//           ),
//           items: items
//               .map<DropdownMenuItem<LandDivision>>(
//                   (LandDivision? item) => DropdownMenuItem<LandDivision>(
//                         value: item,
//                         child: Text(
//                           item!.name!,
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                       ))
//               .toList(),
//           value: valueSelected.value,
//           onChanged: (LandDivision? value) {
//             controller.chooseLand(value!.id!);
//             valueSelected.value = value!;
//           },
//           buttonStyleData: const ButtonStyleData(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             height: 40,
//             width: 140,
//           ),
//           menuItemStyleData: const MenuItemStyleData(
//             height: 40,
//           ),
//         ),
//       ),
//     );
//   }
}
