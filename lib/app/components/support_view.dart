import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:itfsd/app/core/common/dialog/dia_logs.dart';
import 'package:itfsd/app/core/common/dialog/dialog_icon_button.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:lottie/lottie.dart';

import '../routes/app_pages.dart';

class SupportIssue {
  final String title;
  final String description;

  SupportIssue({required this.title, required this.description});
}

class SupportCenterPage extends StatelessWidget {
  final List<SupportIssue> supportIssues = [
    SupportIssue(
      title: 'Lỗi kết nối Internet',
      description:
          'Hướng dẫn sửa lỗi kết nối Internet: kiểm tra kết nối mạng, khởi động lại thiết bị, liên hệ nhà cung cấp dịch vụ Internet.',
    ),
    SupportIssue(
      title: 'Không thể đăng nhập vào ứng dụng',
      description:
          'Hướng dẫn đối phó với vấn đề đăng nhập: kiểm tra tên đăng nhập và mật khẩu, thử đăng nhập lại, đặt lại mật khẩu nếu cần.',
    ),
    SupportIssue(
      title: 'Ứng dụng chậm hoặc đơ',
      description:
          'Hướng dẫn tối ưu hóa hiệu suất ứng dụng: kiểm tra dung lượng bộ nhớ, đóng các ứng dụng đang chạy ngầm, cập nhật ứng dụng.',
    ),
    // Thêm các vấn đề khác tương tự
  ];

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Trung tâm hỗ trợ",
        titleType: AppBarTitle.text,
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () {
          Get.back();
        },
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => CommonDivider(),
        itemCount: supportIssues.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(supportIssues[index].title),
            subtitle: Text(supportIssues[index].description),
            onTap: () {
              _navigateToIssueDetail(context, supportIssues[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showContactNotification(context);
        },
        child: Icon(Icons.contact_support),
      ),
    );
  }

// void _showContactNotification(BuildContext context) {
//     Flushbar(
//       title: "Chúng tôi sẽ liên hệ!",
//       message: "Cảm ơn bạn đã liên hệ với chúng tôi. Chúng tôi sẽ phản hồi trong thời gian sớm nhất.",
//       duration: Duration(seconds: 3),
//     )..show(context);
//   }
  void _showContactNotification(BuildContext context) {
    Dialogs.materialDialog(
        msg:
            'Cảm ơn bạn đã liên hệ với chúng tôi. Chúng tôi sẽ phản hồi trong thời gian sớm nhất.',
        title: "Chúng tôi sẽ liên hệ!",
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
  }

  void _navigateToIssueDetail(BuildContext context, SupportIssue issue) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IssueDetailPage(issue: issue),
      ),
    );
  }
}

class IssueDetailPage extends StatelessWidget {
  final SupportIssue issue;

  IssueDetailPage({required this.issue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết vấn đề'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              issue.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(issue.description),
          ],
        ),
      ),
    );
  }
}
