import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/common_app_bar.dart';
import 'package:itfsd/app/core/common/common_scaffold.dart';
import 'package:itfsd/app/core/constants/app_constants.dart';
import 'package:itfsd/app/resource/theme/app_text_style.dart';
import 'package:itfsd/presentation/page/wage/wage_view.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/presentation/page/wage/workersalaryviews/workersalary_view.dart';

class ListIconwageView extends StatefulWidget {
  const ListIconwageView({super.key});

  @override
  State<ListIconwageView> createState() => _ListIconwageViewState();
}

class _ListIconwageViewState extends State<ListIconwageView>
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
        title: 'Lương',
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
            Expanded(
              flex: 9,
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
                    elevation: 0.3,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        IconButton(
                          onPressed: () {
                            // Get.toNamed(Routes.WAGE);
                            Get.to(() => const WorkersalaryView());
                          },
                          icon: Image.asset(
                            "assets/icons/teamwork.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Danh sách nhân công",
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
                            Get.to(() => const WageView());
                          },
                          icon: Image.asset(
                            "assets/icons/calendar.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Bảng lương",
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
                            "assets/icons/salary.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Thu nhập",
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
