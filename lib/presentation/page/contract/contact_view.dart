import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/page/contract/custtomtabbar_view.dart';
import 'package:itfsd/app/components/buttons/list_icon_phone_number.dart';
import '../../controllers/contract/contact_controller.dart';

class ContactView extends BaseView<ContactController> {
  const ContactView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.background_color,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Get.back();
                    },
                  )),
                  const Expanded(
                      flex: 3,
                      child: Center(
                          child: Text(
                        'Sổ liên hệ',
                        style:
                            TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                      ))),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        Get.to(() => const ListIconPhoneNumber());
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 8,
              child: CustomtabbarView(),
            )
          ],
        ),
      ),
    );
  }
}
