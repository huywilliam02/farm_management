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
import 'package:itfsd/presentation/controllers/wage/workersalarycontrollers/workersalary_controller.dart';

class WorkersalaryView extends BaseView<WorkersalaryController> {
  const WorkersalaryView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    final WorkersalaryController controller = Get.put(WorkersalaryController());

    return Scaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Danh sách nhân công",
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
        padding: EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => CommonDivider(),
          itemCount: controller.workerList.length,
          itemBuilder: (context, index) {
            var worker = controller.workerList[index];
            return InkWell(
              onTap: () {
                controller.selectWorker(worker);
                Get.to(() => WorkerDetailsPage(workerData: worker));
              },
              child: ListTile(
                title: Text(worker.name),
                subtitle: Text('Tổng thu nhập: ${worker.totalEarnings}'),
              ),
            );
          },
        ),
      ),
    );
  }
}

// worker_details.dart

class WorkerDetailsPage extends StatelessWidget {
  final WorkersalaryController controller = Get.find();
  final WorkerModel workerData;

  WorkerDetailsPage({required this.workerData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Chi tiết nhân công",
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
              'Tên nhân công: ${workerData.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Ngày làm việc: ${workerData.workingDays} ngày',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Lương cơ bản: ${workerData.salary}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Tổng thu nhập: ${workerData.totalEarnings}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 10),
            Text(
              'Thưởng: ${workerData.bonus}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Khấu trừ: ${workerData.deductions}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Lương ròng: ${workerData.netSalary}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Ghi chú: ${workerData.notes}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
