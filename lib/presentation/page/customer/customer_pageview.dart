import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/app/core/common/input/common_form_field_widget.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/customer/customer_controller.dart';
import 'package:itfsd/presentation/page/customer/customer_view.dart';
import 'package:itfsd/app/core/common/input/form_field_widget.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:quickalert/quickalert.dart';

class MoreCustomerView extends BaseView<CustomerController> {
  MoreCustomerView({Key? key, this.idCustomer}) : super(key: key);
  String? idCustomer;
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Get.to(() => const CustomerView());
                    },
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      'Tạo khách hàng thăm',
                      style: AppTextStyle.textTitleAppBar,
                    ),
                  ),
                ),
                Expanded(
                    child: idCustomer != null
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
                                  await controller.deleteData(idCustomer!);
                                },
                              );
                            },
                          )
                        : const SizedBox())
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
                      SizedBox(
                        height: UtilsReponsive.height(context, 20),
                      ),
                      Row(
                        children: [
                          Text(
                            "Khách thăm quan",
                            style: GoogleFonts.roboto(
                              // textStyle: Theme.of(context).textTheme.displayLarge,
                              textStyle: TextStyleConstant.grey16RobotoBold,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: UtilsReponsive.height(context, 10),
                      ),
                      CommonFormFieldWidget(
                        controllerEditting: controller.nameController,
                        textInputType: TextInputType.text,
                        setValueFunc: controller.setValueName,
                      ),
                      SizedBox(
                        height: UtilsReponsive.height(context, 10),
                      ),
                      Text(
                        'Số lượng',
                        style: GoogleFonts.roboto(
                          // textStyle: Theme.of(context).textTheme.displayLarge,
                          textStyle: TextStyleConstant.grey16RobotoBold,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(
                        height: UtilsReponsive.height(context, 10),
                      ),
                      CommonFormFieldWidget(
                        textInputType: TextInputType.text,
                        initValue: controller.quantity.toString(),
                        setValueFunc: (value) {
                          controller.quantity.value = int.tryParse(value) ?? 0;
                        },
                      ),
                      SizedBox(
                        height: UtilsReponsive.height(context, 10),
                      ),
                      Text(
                        "Ngày bắt đầu",
                        style: GoogleFonts.roboto(
                          // textStyle: Theme.of(context).textTheme.displayLarge,
                          textStyle: TextStyleConstant.grey16RobotoBold,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(
                        height: UtilsReponsive.height(context, 10),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await controller.chooseDate(true);
                        },
                        child: CommonFormFieldWidget(
                            isEnabled: false,
                            suffixIcon: const Icon(Icons.calendar_month),
                            controllerEditting:
                                controller.receptionDayController,
                            setValueFunc: () {}),
                      ),
                      SizedBox(
                        height: UtilsReponsive.height(context, 10),
                      ),
                      Text(
                        'Ghi chú',
                        style: GoogleFonts.roboto(
                          // textStyle: Theme.of(context).textTheme.displayLarge,
                          textStyle: TextStyleConstant.grey16RobotoBold,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(
                        height: UtilsReponsive.height(context, 10),
                      ),
                      CommonFormFieldWidget(
                        textInputType: TextInputType.text,
                        controllerEditting: controller.descriptionController,
                        setValueFunc: controller.setValuedescription,
                      ),
                      SizedBox(
                        height: UtilsReponsive.height(context, 10),
                      ),
                      Text(
                        'Trạng thái',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyleConstant.grey16RobotoBold,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
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
                        height: UtilsReponsive.height(context, 10),
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
                          child: Text(
                            idCustomer != null ? "Cập nhật" : "Xác nhận",
                            style: TextStyleConstant.white16Roboto,
                          ),
                          onPressed: () async {
                            await controller.createCustomer(idCustomer);
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
      ),
    );
  }
}
