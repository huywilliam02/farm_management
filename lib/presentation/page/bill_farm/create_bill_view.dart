import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/bill_farm/bill_farm_controller.dart';
import 'package:itfsd/app/core/common/form_field_widget.dart';

class CreateBillView extends BaseView<BillFarmController> {
  const CreateBillView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      const Expanded(
                        flex: 16,
                        child: Center(
                          child: Text(
                            'Tạo hóa đơn',
                            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/icons/checkmark.png",
                        ),
                      ),
                      const Expanded(child: SizedBox())
                    ],
                  )),
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
                            const Row(
                              children: [
                                Text(
                                  "Tháng ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 70,
                              child: FormFieldWidget(
                                // isEnabled: false,
                                suffixIcon: const Icon(Icons.calendar_month),
                                // controllerEditting: controller.unitController,
                                  setValueFunc: () {}),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Tổng tiêu thu (kW)',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 70,
                              child: FormFieldWidget(
                                // isEnabled: false,
                                // textInputType: ,
                                // suffixIcon: const Icon(Icons.arrow_drop_down),
                                // controllerEditting: controller.unitController,
                                  setValueFunc: () {}),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Tổng tiền (đ)",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 70,
                              child: FormFieldWidget(

                                // suffixIcon: const Icon(Icons.arrow_drop_down),
                                // controllerEditting: controller.unitController,
                                  setValueFunc: () {}),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Phương thức thanh toán',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 70,
                              child: FormFieldWidget(

                                suffixIcon: const Icon(Icons.arrow_drop_down),
                                // controllerEditting: controller.unitController,
                                  setValueFunc: () {}),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Ghi chú',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 70,
                              child: FormFieldWidget(

                                // suffixIcon: const Icon(Icons.arrow_drop_down),
                                // controllerEditting: controller.unitController,
                                  setValueFunc: () {}),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}
