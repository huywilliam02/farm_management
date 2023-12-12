import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/dialog/dia_logs.dart';
import 'package:itfsd/app/core/common/dialog/dialog_icon_button.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/wage/wage_controller.dart';

class WageView extends BaseView<WageController> {
  final WageController controller = Get.put(WageController());

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Danh sách bảng lương",
        titleType: AppBarTitle.text,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        centerTitle: true,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () {
          Get.back();
        },
        actions: [
          IconButton(
              onPressed: () {
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
              icon: Icon(IconsUtils.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => CommonDivider(),
          itemCount: controller.wageList.length,
          itemBuilder: (context, index) {
            final wage = controller.wageList[index];
            return ListTile(
              title: Text("Kỳ " + wage.period),
              subtitle: Text(wage.totalSalary),
              onTap: () {
                controller.selectWage(wage);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WageDetailsView(
                      wageData: wage,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class WageDetailsView extends StatelessWidget {
  final WageModel wageData;

  WageDetailsView({required this.wageData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Chi tiết bảng lương",
        titleType: AppBarTitle.text,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        centerTitle: true,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () {
          Get.back();
        },
        actions: [
          IconButton(
              onPressed: () {
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
              icon: Icon(IconsUtils.edit))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kỳ tính lương: ${wageData.period}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Số nhân công: ${wageData.workers}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Trạng thái: ${wageData.status}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Tổng lương: ${wageData.totalSalary}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 10),
            Text(
              'Thưởng: ${wageData.bonus}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Khấu trừ: ${wageData.deductions}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Lương ròng: ${wageData.netSalary}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Ghi chú: ${wageData.notes}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
