import 'package:cached_network_image/cached_network_image.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:itfsd/app/components/buttons/income_other.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/app/core/common/shimmer/listview/loading_item.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/components/buttons/button_tab_view.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/data/model/news/news_model.dart';
import 'package:itfsd/presentation/controllers/edit_profile/edit_profile_controller.dart';
import 'package:itfsd/presentation/controllers/home/home_controller.dart';
import 'package:itfsd/presentation/page/home/notification/notification_Item.dart';
import 'package:itfsd/presentation/page/home/notification/notification_detail.dart';
import 'package:itfsd/presentation/page/news/home_page.dart';

class ListNotification extends BaseView<HomeController> {
  const ListNotification({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Thông báo",
        titleType: AppBarTitle.text,
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () {
          Get.back();
        },
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconsUtils.delete),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => CommonDivider(),
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.agriculturalNotificationList.length,
              itemBuilder: (context, index) {
                AgriculturalNotification notification =
                    controller.agriculturalNotificationList[index];
                return ListTile(
                  title: Text(notification.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.content),
                      Text(
                        DateFormat.yMMMMd()
                            .add_jm()
                            .format(notification.timestamp),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  leading: Image.asset(
                    notification.imageUrl,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  // Add more UI components as needed
                  onTap: () {
                    // Navigate to the detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NotificationDetailPage(notification: notification),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
