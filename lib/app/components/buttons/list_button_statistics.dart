import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/common_app_bar.dart';
import 'package:itfsd/app/core/common/common_scaffold.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/presentation/page/workinday/calendar_view.dart';

class ListIconStatistics extends StatefulWidget {
  const ListIconStatistics({super.key});

  @override
  State<ListIconStatistics> createState() => _ListIconStatisticsState();
}

class _ListIconStatisticsState extends State<ListIconStatistics>
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
        title: 'Quản lý thống kê',
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
            Container(
              color: Colors.white,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 5 / 4,
                crossAxisSpacing: 9,
                mainAxisSpacing: 9,
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                children: [
                  Card(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.CHART_RESOURCES);
                          },
                          icon: Image.asset(
                            "assets/icons/natural-resources.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Tài nguyên nông trại",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.CHART_WAREHOUSE);
                          },
                          icon: Image.asset(
                            "assets/icons/material-management.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Kho",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(() => const CalendarWorkindayView());
                            // Get.toNamed(Routes.FARMING_CALENDAR);
                          },
                          icon: Image.asset(
                            "assets/icons/tasks.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Công việc",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.CHART_QUANLITY);
                          },
                          icon: Image.asset(
                            "assets/icons/statistics.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Sản lượng",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.CHART_USER);
                          },
                          icon: Image.asset(
                            "assets/icons/human.png",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
