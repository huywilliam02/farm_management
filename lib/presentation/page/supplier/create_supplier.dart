import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/app/core/common/input/common_form_field_widget.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/app/util/number_format_utils.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/supplier/supplier_controller.dart';
import 'package:itfsd/app/core/common/input/form_field_widget.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:quickalert/quickalert.dart';

class Moresupplier extends BaseView<SupplierController> {
  Moresupplier({Key? key, this.idsupplier}) : super(key: key);
  String? idsupplier;
  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
        backgroundColor: ColorConstant.background_color,
        appBar: CommonAppBar(
          title: 'Tạo nhà cung cấp',
          titleType: AppBarTitle.text,
          titleTextStyle: AppTextStyle.textTitleAppBar,
          centerTitle: true,
          leadingIcon: const Icon(Icons.arrow_back_ios_new),
          onLeadingPressed: () {
            Get.back();
          },
          actions: [
            idsupplier != null
                ? IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.confirm,
                        title: "Bạn chắc chắn muốn xóa chứ ?",
                        confirmBtnText: "Xác nhận",
                        cancelBtnText: "Hủy bỏ",
                        onConfirmBtnTap: () async {
                          await controller.deleteData(idsupplier!);
                        },
                      );
                    },
                  )
                : const SizedBox()
          ],
        ),
        body: SafeArea(
          child: Column(
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
                              "Tên nhà cung cấp",
                              style: AppTextStyle.textTitleForm,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: UtilsReponsive.height(context, 10),
                        ),
                        CommonFormFieldWidget(
                          controllerEditting: controller.namesupplierController,
                          textInputType: TextInputType.text,
                          setValueFunc: controller.setValueName,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Địa chỉ',
                          style: AppTextStyle.textTitleForm,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CommonFormFieldWidget(
                          textInputType: TextInputType.text,
                          controllerEditting: controller.addresssController,
                          // suffixIcon: const Icon(Icons.arrow_drop_down),

                          setValueFunc: controller.setValueAddress,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Dư nợ",
                          style: AppTextStyle.textTitleForm,
                        ),
                        SizedBox(
                          height: UtilsReponsive.height(context, 10),
                        ),
                        CommonFormFieldWidget(
                            textInputType: TextInputType.number,
                            // suffixIcon: const Icon(Icons.arrow_drop_down),
                            initValue: NumberFormatUtils.formatNumber(
                                controller.debt.toInt()),
                            // controllerEditting: controller.debtController,
                            setValueFunc: (value) {
                              controller.debt.value = int.tryParse(value) ?? 0;
                            }),
                        SizedBox(
                          height: UtilsReponsive.height(context, 10),
                        ),
                        Text(
                          'Số điện thoại',
                          style: AppTextStyle.textTitleForm,
                        ),
                        SizedBox(
                          height: UtilsReponsive.height(context, 10),
                        ),
                        CommonFormFieldWidget(
                          textInputType: TextInputType.text,
                          // suffixIcon: const Icon(Icons.arrow_drop_down),
                          controllerEditting: controller.phonenumberController,
                          setValueFunc: controller.setValuephonenumber,
                        ),
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
                          controllerEditting: controller.descriptionController,
                          setValueFunc: controller.setValueNote,
                        ),
                        SizedBox(
                          height: UtilsReponsive.height(context, 40),
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
                            child: Text(
                              idsupplier != null ? "Cập nhật" : "Xác nhận",
                              style: TextStyleConstant.white16Roboto,
                            ),
                            onPressed: () async {
                              await controller.createSupplier(idsupplier);
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
        ));
  }
}
