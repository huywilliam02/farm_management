import 'package:flutter/material.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/fundnumber/fundnumber_controller.dart';

import '../../controllers/agricultural_products/agricultural_products_constant.dart';

class FundDetailPage extends StatelessWidget {
  final Map<String, dynamic> fundData;

  FundDetailPage({required this.fundData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Chi tiết quỹ ",
        titleType: AppBarTitle.text,
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () {
          Get.back();
          // Get.offNamed(Routes.MAIN_TABVIEW);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fundData['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Tổng giá trị: ${fundData["t"]}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 10),
            Text(
              'Ngày dự trù: ${fundData["y"]}',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Container(
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            Text(
              'Chi tiết dự trù:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Loại: ${fundData["l"]}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              'Mô tả: ... (Thêm mô tả chi tiết ở đây)',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class FundNumberView extends BaseView<FundnumberController> {
  FundNumberView({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> customList = [
    {
      'name': 'Mua sắm thiết bị',
      't': "32,170,000 đ",
      'y': "29/7/2023",
      'l': "Đã dự trù",
      'description':
          'Dự trù chi phí để mua sắm thiết bị cần thiết cho mùa vụ mới.',
    },
    {
      'name': 'Tham dự hội thảo',
      't': "16,800,000 đ",
      'y': "25/9/2023",
      'l': "Đã dự trù",
      'description':
          'Chi phí tham dự hội thảo nâng cao kiến thức và kỹ năng nông nghiệp.',
    },
    {
      'name': 'Mua máy cho mùa vụ mới',
      't': "5,900,000 đ",
      'y': "22/10/2023",
      'l': "Đã dự trù",
      'description': 'Dự trù chi phí để mua máy móc cần thiết cho mùa vụ mới.',
    },
    {
      'name': 'Đi ký kết hợp đồng',
      't': "16,970,000 đ",
      'y': "29/10/2023",
      'l': "Đã dự trù",
      'description':
          'Dự trù chi phí để đi ký kết hợp đồng với đối tác nông nghiệp.',
    },
    {
      'name': 'Mua phân bón và hóa chất',
      't': "12,300,000 đ",
      'y': "15/12/2023",
      'l': "Đã dự trù",
    },
    {
      'name': 'Đầu tư nâng cấp hệ thống tưới tiêu',
      't': "25,000,000 đ",
      'y': "20/1/2024",
      'l': "Đã dự trù",
    },
    {
      'name': 'Mua giống cây mới',
      't': "9,800,000 đ",
      'y': "5/3/2024",
      'l': "Đã dự trù",
    },
    {
      'name': 'Dự trù chi phí thu hoạch',
      't': "15,600,000 đ",
      'y': "18/4/2024",
      'l': "Đã dự trù",
    },
    {
      'name': 'Đầu tư công nghệ mới',
      't': "20,000,000 đ",
      'y': "10/6/2024",
      'l': "Đã dự trù",
    },
    // Thêm 10 dữ liệu nữa
    {
      'name': 'Dự trù mua đất mới',
      't': "50,000,000 đ",
      'y': "15/8/2024",
      'l': "Đã dự trù",
    },
    {
      'name': 'Tham gia triển lãm nông nghiệp',
      't': "18,700,000 đ",
      'y': "20/9/2024",
      'l': "Đã dự trù",
    },
    {
      'name': 'Mua máy cày mới',
      't': "23,500,000 đ",
      'y': "5/11/2024",
      'l': "Đã dự trù",
    },
    {
      'name': 'Dự trù chi phí marketing',
      't': "13,200,000 đ",
      'y': "10/12/2024",
      'l': "Đã dự trù",
    },
    {
      'name': 'Đầu tư hệ thống giáo dục nông nghiệp',
      't': "30,000,000 đ",
      'y': "15/2/2025",
      'l': "Đã dự trù",
    },
    {
      'name': 'Mua đàn gia cầm mới',
      't': "9,000,000 đ",
      'y': "20/4/2025",
      'l': "Đã dự trù",
    },
    {
      'name': 'Dự trù chi phí nghiên cứu',
      't': "25,800,000 đ",
      'y': "5/6/2025",
      'l': "Đã dự trù",
    },
    {
      'name': 'Tham gia hội chợ nông sản',
      't': "22,400,000 đ",
      'y': "10/8/2025",
      'l': "Đã dự trù",
    },
    {
      'name': 'Mua máy sấy nông sản',
      't': "17,900,000 đ",
      'y': "15/10/2025",
      'l': "Đã dự trù",
    },
    {
      'name': 'Dự trù chi phí vận chuyển',
      't': "14,300,000 đ",
      'y': "20/12/2025",
      'l': "Đã dự trù",
    },
  ];

  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        title: "Danh sách số quỹ ",
        titleType: AppBarTitle.text,
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () {
          Get.offNamed(Routes.MAIN_TABVIEW);
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Divider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Hiện thị: 15 ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                // TODO: Add filter functionality
                              },
                              icon: const Image(
                                  image: AssetImage(
                                      "assets/icons/filtration.png"))),
                          IconButton(
                              onPressed: () {
                                // TODO: Add functionality to add new fund
                              },
                              icon: const Icon(Icons.add)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
            Expanded(
              flex: 9,
              child: ListView.separated(
                padding: const EdgeInsets.all(15),
                itemCount: customList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (context, index) {
                  final item = customList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FundDetailPage(fundData: item),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  item['name'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 150,
                                  color: Colors.grey,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset("assets/icons/money.png"),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        item['l'],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  item["t"],
                                  style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  item["y"],
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
