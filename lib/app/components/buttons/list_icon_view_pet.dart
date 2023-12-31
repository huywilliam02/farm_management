import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/app/routes/app_pages.dart';

class ListIconPetView extends StatefulWidget {
  const ListIconPetView({super.key});

  @override
  State<ListIconPetView> createState() => _ListIconPetViewState();
}

class _ListIconPetViewState extends State<ListIconPetView>
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
        title: 'Quản lý chăn nuôi',
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
                    color: ColorConstant.background_color,
                    elevation: 0.3,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.VIEW_LANDFULL);
                          },
                          icon: Image.asset(
                            "assets/icons/land.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Vùng canh tác",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: ColorConstant.background_color,
                    elevation: 0.3,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/icons/calendartree.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Lịch bệnh tật",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: ColorConstant.background_color,
                    elevation: 0.3,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.WORKINDAY);
                          },
                          icon: Image.asset(
                            "assets/icons/time-management.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Việc làm trong ngày",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: ColorConstant.background_color,
                    elevation: 0.3,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/icons/chicken.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Thêm vật nuôi",
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
                            Get.toNamed(Routes.CUSTOMER);
                          },
                          icon: Image.asset(
                            "assets/icons/team.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Khách thăm",
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
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/icons/iot.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Theo dõi vật nuôi",
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
