import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/fundnumber/fundnumber_controller.dart';
import 'package:itfsd/app/core/common/form_field_widget.dart';

class CreateFundnumber extends BaseView<FundnumberController> {
  const CreateFundnumber({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        body: Column(
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
              flex: 6,
              child: Center(
                child: Text(
                  'Tạo phiếu chi',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                ),
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
                            'Số tiền',
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
                            isEnabled: false,
                            // suffixIcon: const Icon(Icons.arrow_drop_down),
                            // controllerEditting: controller.unitController,
                            setValueFunc: () {}),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Loại phiếu chi',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 70,
                        child: FormFieldWidget(
                            isEnabled: false,
                            suffixIcon: const Icon(Icons.arrow_drop_down),
                            // controllerEditting: controller.unitController,
                            setValueFunc: () {}),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Ngày chứng từ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 70,
                        child: FormFieldWidget(
                            isEnabled: false,
                            suffixIcon: const Icon(Icons.calendar_month),
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
                            isEnabled: false,
                            suffixIcon: const Icon(Icons.arrow_drop_down),
                            // controllerEditting: controller.unitController,
                            setValueFunc: () {}),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Đối tượng giao dịch',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 70,
                        child: FormFieldWidget(
                            isEnabled: false,
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
                            isEnabled: false,
                            // suffixIcon: const Icon(Icons.arrow_drop_down),
                            // controllerEditting: controller.unitController,
                            setValueFunc: () {}),
                      ),
                    ],
                  ),
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
                        // controller.newLand();
                        // controller.newLand();
                      },
                      child: const Text("Xác nhận"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
