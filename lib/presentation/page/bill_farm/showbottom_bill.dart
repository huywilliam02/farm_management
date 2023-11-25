import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/shoppings/shoppings_controller.dart';
import 'package:itfsd/presentation/page/bill_farm/create_bill_view.dart';

class ShowBottomBill extends BaseView<ShoppingsController> {
  const ShowBottomBill({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "Chọn loại hóa đơn",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Get.to(() => const CreateBillView());
            },
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(image: AssetImage("assets/icons/addshop.png")),
            ),
            title: const Text("Hoá đơn điện"),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Get.to(() => const CreateBillView());
            },
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/icons/addshop.png"),
            ),
            title: const Text("Hóa đơn mua sắm "),
          ),
        ],
      ),
    );
  }
}
