import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/wage/wage_controller.dart';
import 'package:itfsd/app/core/common/input/form_field_widget.dart';

class Editstorewarehouse extends BaseView<WageController> {
  const Editstorewarehouse({Key? key}) : super(key: key);
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
            const SizedBox(
              width: 15,
            ),
            const Expanded(
              flex: 16,
              child: Center(
                child: Text(
                  'Sửa thông tin hàng hóa',
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
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.network(
                            fit: BoxFit.cover,
                            width: 100,
                            "http://thienbangvn.com/uploads/product/THIENBANG_GIA_CAM/AG_300.png"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Tên hàng hóa",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Text(
                            " *",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
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
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
