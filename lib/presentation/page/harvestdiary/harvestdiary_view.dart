import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/presentation/page/harvestdiary/diary_view.dart';

import '../../controllers/harvestdiary/harvestdiary_controller.dart';

class HarvestdiaryView extends GetView<HarvestdiaryController> {
  const HarvestdiaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.background_color,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const Expanded(
                      child: Center(
                          child: Text(
                    'Nhật ký thu hoạch',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                  ))),
                  const SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 8,
              child: DiaryView(),
            )
          ],
        ),
      ),
    );
  }
}
