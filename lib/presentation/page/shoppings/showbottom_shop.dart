import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/dialog/dia_logs.dart';
import 'package:itfsd/app/core/common/dialog/dialog_icon_button.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/shoppings/shoppings_controller.dart';
import 'package:itfsd/presentation/page/shoppings/harvest_bill_view.dart';

class ShowBottomShop extends BaseView<ShoppingsController> {
  const ShowBottomShop({Key? key}) : super(key: key);
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
                "Chọn loại nhập đơn",
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
              Dialogs.materialDialog(
                  msg:
                      'Chỉ có chủ hội và thư ký hoặc người có quyền mới sử dụng được tính năng này.',
                  title: "Bạn không có quyền truy cập",
                  color: Colors.white,
                  context: context,
                  actions: [
                    DiaLogIconsButton(
                      onPressed: () {
                        Get.back();
                      },
                      text: 'Trở lại',
                      iconData: Icons.cancel_outlined,
                      color: Colors.white,
                      textStyle: TextStyle(color: Colors.grey),
                      iconColor: Colors.grey,
                    ),
                  ]);
            },
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(image: AssetImage("assets/icons/addshop.png")),
            ),
            title: const Text("Thu hoạch trực tiếp"),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Dialogs.materialDialog(
                  msg:
                      'Chỉ có chủ hội và thư ký hoặc người có quyền mới sử dụng được tính năng này.',
                  title: "Bạn không có quyền truy cập",
                  color: Colors.white,
                  context: context,
                  actions: [
                    DiaLogIconsButton(
                      onPressed: () {
                        Get.back();
                      },
                      text: 'Trở lại',
                      iconData: Icons.cancel_outlined,
                      color: Colors.white,
                      textStyle: TextStyle(color: Colors.grey),
                      iconColor: Colors.grey,
                    ),
                  ]);
            },
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/icons/addshop.png"),
            ),
            title: const Text("Bán từ kho"),
          ),
        ],
      ),
    );
  }
}
