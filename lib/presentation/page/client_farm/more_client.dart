import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/client_farm/client_farm_controller.dart';
import 'package:itfsd/presentation/page/client_farm/client_farm_view.dart';
import 'package:itfsd/app/core/common/form_field_widget.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MoreClientView extends BaseView<ClientFarmController> {
  MoreClientView({Key? key, this.idClient}) : super(key: key);
  String? idClient;
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
                      Get.to(() => const ClientFarmView());
                    },
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      'Tạo khách hàng',
                      style: AppTextStyle.textTitleAppBar,
                    ),
                  ),
                ),
                Expanded(
                    child: idClient != null
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
                                  await controller.deleteData(idClient!);
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
                      Row(
                        children: [
                          Text(
                            "Tên khách hàng",
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
                          controllerEditting: controller.nameClientController,
                          textInputType: TextInputType.text,
                          setValueFunc: controller.setValueName,
                        ),
                      ),
                      SizedBox(
                        height: UtilsReponsive.height(context, 10),
                      ),
                      Text(
                        'Địa chỉ',
                        style: AppTextStyle.textTitleForm,
                      ),
                      SizedBox(
                        height: UtilsReponsive.height(context, 10),
                      ),
                      SizedBox(
                        height: 70,
                        child: FormFieldWidget(
                          textInputType: TextInputType.text,
                          controllerEditting: controller.addresssController,
                          // suffixIcon: const Icon(Icons.arrow_drop_down),

                          setValueFunc: controller.setValueAddress,
                        ),
                      ),
                      SizedBox(
                        height: UtilsReponsive.height(context, 10),
                      ),
                      Text(
                        "Dư nợ",
                        style: AppTextStyle.textTitleForm,
                      ),
                      SizedBox(
                        height: UtilsReponsive.height(context, 10),
                      ),
                      SizedBox(
                        height: 70,
                        child: FormFieldWidget(
                            textInputType: TextInputType.number,
                            // suffixIcon: const Icon(Icons.arrow_drop_down),
                            initValue: controller.debt.toString(),
                            setValueFunc: (value) {
                              controller.debt.value = int.tryParse(value) ?? 0;
                            }),
                      ),
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
                      SizedBox(
                        height: 70,
                        child: FormFieldWidget(
                          textInputType: TextInputType.text,
                          // suffixIcon: const Icon(Icons.arrow_drop_down),
                          controllerEditting: controller.phonenumberController,
                          setValueFunc: controller.setValuephonenumber,
                        ),
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
                      SizedBox(
                        height: 70,
                        child: FormFieldWidget(
                          textInputType: TextInputType.text,
                          controllerEditting: controller.descriptionController,
                          setValueFunc: controller.setValueNote,
                        ),
                      ),
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
                            idClient != null ? "Cập nhật" : "Xác nhận",
                            style: TextStyleConstant.white16Roboto,
                          ),
                          onPressed: () async {
                            await controller.createClient(idClient);
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
