// notification_detail_page.dart

import 'package:flutter/material.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/presentation/controllers/agricultural_products/agricultural_products_constant.dart';
import 'package:itfsd/presentation/page/home/notification/notification_Item.dart';

class NotificationDetailPage extends StatelessWidget {
  final AgriculturalNotification notification;

  const NotificationDetailPage({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Chi tiết thông báo",
        leadingIcon: IconsUtils.back,
        centerTitle: true,
        titleType: AppBarTitle.text,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        onLeadingPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              notification.content,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              "Thời gian: ${notification.timestamp.toLocal()}",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Image.asset(
              notification.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
