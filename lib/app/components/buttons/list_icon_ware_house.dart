import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/common_app_bar.dart';
import 'package:itfsd/app/core/common/common_scaffold.dart';
import 'package:itfsd/app/core/constants/app_constants.dart';
import 'package:itfsd/app/resource/theme/app_text_style.dart';
import 'package:itfsd/app/routes/app_pages.dart';

class ListIconwarehouseView extends StatefulWidget {
  const ListIconwarehouseView({super.key});

  @override
  State<ListIconwarehouseView> createState() => _ListIconwarehouseViewState();
}

class _ListIconwarehouseViewState extends State<ListIconwarehouseView>
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
        title: 'Quản lý kho',
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
                            Get.toNamed(Routes.STOREWAREHOUSE);
                          },
                          icon: Image.asset(
                            "assets/icons/warehouserun.png",
                            height: 55,
                          ),
                        ),
                        const Text(
                          "Kho hàng hóa",
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
                            Get.toNamed(Routes.MATERIAL);
                          },
                          icon: Image.asset(
                            "assets/icons/supplies.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Vật tư",
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
                            Get.toNamed(Routes.INGREDIENTS);
                          },
                          icon: Image.asset(
                            "assets/icons/food-donation.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Kho nguyên liệu",
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
                            Get.toNamed(Routes.AGRICULTURAL_PRODUCTS);
                          },
                          icon: Image.asset(
                            "assets/icons/forklift.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Kho thu hoạch",
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
                            Get.toNamed(Routes.SUPPLIER);
                          },
                          icon: Image.asset(
                            "assets/icons/handshake.png",
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
                    color: ColorConstant.background_color,
                    elevation: 0.3,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.UNITFARM);
                          },
                          icon: Image.asset(
                            "assets/icons/shopping-bag.png",
                            height: 55,
                          ),
                          iconSize: 50,
                        ),
                        const Text(
                          "Đơn vị tính",
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
