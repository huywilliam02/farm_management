import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/common_app_bar.dart';
import 'package:itfsd/app/core/common/common_scaffold.dart';
import 'package:itfsd/app/core/constants/app_constants.dart';
import 'package:itfsd/app/resource/theme/app_text_style.dart';
import 'package:itfsd/app/routes/app_pages.dart';

class ListIconPhoneNumber extends StatefulWidget {
  const ListIconPhoneNumber({super.key});

  @override
  State<ListIconPhoneNumber> createState() => _ListIconPhoneNumberState();
}

class _ListIconPhoneNumberState extends State<ListIconPhoneNumber>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: 'Quản lý liên hệ',
        titleType: AppBarTitle.text,
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: const Icon(Icons.arrow_back_ios_new),
        onLeadingPressed: () => Get.offAllNamed(Routes.MAIN_TABVIEW),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 5 / 4,
              crossAxisSpacing: 9,
              mainAxisSpacing: 9,
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              children: [
                Card(
                  elevation: 0.3,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.SUPPLIER);
                        },
                        icon: Image.asset(
                          "assets/icons/team.png",
                          height: 55,
                        ),
                        iconSize: 50,
                      ),
                      const Text(
                        "Nhà cung cấp",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 0.3,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.CLIENT_FARM);
                        },
                        icon: Image.asset(
                          "assets/icons/client.png",
                          height: 55,
                        ),
                        iconSize: 50,
                      ),
                      const Text(
                        "Khách hàng",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 0.3,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      IconButton(
                        onPressed: () {
                          // Get.toNamed(Routes.FARMING_CALENDAR);
                        },
                        icon: Image.asset(
                          "assets/icons/user.png",
                          height: 55,
                        ),
                        iconSize: 50,
                      ),
                      const Text(
                        "Nhân viên",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 0.3,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.OTHEROBJECT);
                        },
                        icon: Image.asset(
                          "assets/icons/handshakee.png",
                          height: 55,
                        ),
                        iconSize: 50,
                      ),
                      const Text(
                        "Đối tượng khác",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
