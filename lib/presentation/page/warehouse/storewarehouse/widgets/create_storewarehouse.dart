import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/wage/wage_controller.dart';
import 'package:itfsd/app/core/common/form_field_widget.dart';

class Createstorewarehouse extends BaseView<WageController> {
  const Createstorewarehouse({Key? key}) : super(key: key);
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
              flex: 16,
              child: Center(
                child: Text(
                  'Tạo hàng hóa',
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
                            "Tên hàng hóa",
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
                            // suffixIcon: const Icon(Icons.arrow_drop_down),
                            // controllerEditting: controller.unitController,
                            setValueFunc: () {}),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Số lượng',
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
                        "Giá tiền (đ)",
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
                        'Quy cách',
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
                        'Phân loại',
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
                      child: const Text("xác nhận"),
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
