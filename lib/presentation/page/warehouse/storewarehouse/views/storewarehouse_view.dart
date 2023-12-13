import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/dialog/dia_logs.dart';
import 'package:itfsd/app/core/common/dialog/dialog_icon_button.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/presentation/page/warehouse/storewarehouse/widgets/create_storewarehouse.dart';
import 'package:itfsd/presentation/page/warehouse/storewarehouse/widgets/edit_storeware.dart';

class StorewarehouseView extends StatefulWidget {
  const StorewarehouseView({Key? key}) : super(key: key);
  @override
  State<StorewarehouseView> createState() => _StorewarehouseViewState();
}

class _StorewarehouseViewState extends State<StorewarehouseView> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> customList = [
      {
        'name':
            'AG 300 - THỨC ĂN HỖN HỢP CAO CẤP DẠNG VIÊN (DÙNG CHO GÀ TỪ 1 ĐẾN 22 NGÀY)',
        'k': "50 Bao",
        'img':
            "http://thienbangvn.com/uploads/product/THIENBANG_GIA_CAM/AG_300.png",
        'price': '500,000 đ',
        'expiryDate': '30/12/2023',
        'manufacturer': 'Công ty ABC',
        'description': 'Thức ăn chất lượng cao dành cho gia cầm.',
        'rating': 4.5,
        'reviews': 120,
        'weight': '5 kg',
        'color': 'xanh', // Thêm trường màu sắc
      },
      {
        'name': 'Hạt giống dưa hấu Super An Tiêm 037',
        'k': "150 Gói",
        'img':
            "https://phudienseed.com.vn/wp-content/uploads/2022/11/z3865941077773_d1bbb871919a1095538b3e207fcd4b5a-768x1093.jpg",
        'price': '200,000 đ',
        'expiryDate': '25/12/2023',
        'manufacturer': 'Công ty JH',
        'description': 'Hạt giống dưa hấu chất lượng cao dành cho vườn trồng.',
        'rating': 4.7,
        'reviews': 85,
        'weight': '2 kg',
        'color': 'đỏ',
      },
      {
        'name':
            'Thức ăn cá tra Cargill 7605 18% đạm cho cá ăn hoặc dùng câu cá cám cá',
        'k': "200 Bao",
        'img':
            "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcS1xlvuuaSu2N4HpYXmtK8Hj4_JDI_2RGKNxWFvELVipggqembyI8dBOVunvFw1W89uq2G3c0cpU6jaGFDk6_ELB_bRclpSL-yzgW3T5PA&usqp=CAc",
        'price': '500,000 đ',
        'expiryDate': '30/11/2023',
        'manufacturer': 'Cargill Corporation',
        'description':
            'Thức ăn cá tra chất lượng cao, 18% đạm, thích hợp cho cá ăn hoặc câu cá cám cá.',
        'rating': 4.5,
        'reviews': 120,
        'weight': '5 kg',
        'color': 'Nâu',
      },
      {
        'name':
            'Thức Ăn Cho Cá Cargill 1 Đến 6 Mm Thích Hợp Nuôi Các Loại Cá Nước Ngọt',
        'k': "150 Bao",
        'img':
            "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTiSMz1QKsaDC-z3R2K47G5pKjIadssyXDx2XPvIaAfOIoG5nitgPycohFsKusuDIKityImlvIqRnXDpixSeNe1FW1_oQPdku-LuPdklrg&usqp=CAE",
        'price': '300,000 đ',
        'expiryDate': '15/12/2023',
        'manufacturer': 'Cargill Corporation',
        'description':
            'Thức ăn cho cá, hạt 1 đến 6 mm, thích hợp nuôi các loại cá nước ngọt.',
        'rating': 4.8,
        'reviews': 95,
        'weight': '3 kg',
        'color': 'vàng',
      },
      {
        'name':
            'Promin Gold kích thích bắt mồi bổ sung dưỡng chất dùng cho nuôi trồng',
        'k': "75 lọ",
        'img':
            "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTasRA2o_ql3MiBZitSjtGad7d4XTtPpq_0li2ocTkNJ11CQxdnviSVqHs_6EGdSJNrNcCRnw8-5PKhQJezTA5Sjfhhgw0brD9q322eh1DB6FVeG4mmQP-2SQ&usqp=CAE",
        'price': '150,000 đ',
        'expiryDate': '20/12/2023',
        'manufacturer': 'Gold Corporation',
        'description':
            'Promin Gold kích thích bắt mồi, bổ sung dưỡng chất cho nuôi trồng.',
        'rating': 4.6,
        'reviews': 110,
        'weight': '1.5 kg',
        'color': 'xanh',
      },
      {
        'name': 'lansy post, thức ăn cho tôm cá 1lon 1,250kg',
        'k': "50 Hộp",
        'img':
            "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcS7eVsW0NCGSXNeY46sGtadtRrnT3_9w_7k0oPz-gr47ZbMcNq6t6JbfzemHjeJbfyDqWHhN3VOL7nZ8omS0WLzb1fuJD4XysEWP57ZM9IZ&usqp=CAE",
        'price': '1,000,000 đ',
        'expiryDate': '10/12/2023',
        'manufacturer': 'Lansy Corporation',
        'description': 'lansy post, thức ăn cho tôm cá 1lon 1,250kg.',
        'rating': 4.9,
        'reviews': 130,
        'weight': '12.5 kg',
        'color': 'trắng',
      },
      {
        'name':
            'AG 300 - THỨC ĂN HỖN HỢP CAO CẤP DẠNG VIÊN (DÙNG CHO GÀ TỪ 1 ĐẾN 22 NGÀY)',
        'k': "50 Bao",
        'img':
            "http://thienbangvn.com/uploads/product/THIENBANG_GIA_CAM/AG_300.png",
        'price': '800,000 đ',
        'expiryDate': '22/12/2023',
        'manufacturer': 'AG Corporation',
        'description':
            'AG 300 - Thức ăn hỗn hợp cao cấp dạng viên, dùng cho gà từ 1 đến 22 ngày.',
        'rating': 4.6,
        'reviews': 100,
        'weight': '8 kg',
        'color': 'cam',
      },
    ];
    return Scaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Chi tiết bảng lương",
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
      body: SafeArea(
        child: Column(
          children: [

            const Divider(
              height: 2,
              thickness: 2,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Tìm kiếm",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage(
                          "assets/icons/filtration.png",
                        ),
                        height: 30,
                      ))),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(10),
                itemCount: customList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (context, index) {
                  final item = customList[index];
                  return Column(children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => WarehouseDetailsView(item: item));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.network(
                              item["img"],
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      item["name"],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      item["k"],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Image.asset(
                              "assets/icons/next.png",
                              height: 15,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WarehouseDetailsView extends StatelessWidget {
  final Map<String, dynamic> item;

  const WarehouseDetailsView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Chi tiết bảng lương",
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
            Image.network(
              item['img'],
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              item['name'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Giá: ${item['price']}',
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),
            const SizedBox(height: 8),
            Text(
              'Kích thước: ${item['k']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Ngày hết hạn: ${item['expiryDate']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Nhà sản xuất: ${item['manufacturer']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Đánh giá: ${item['rating']}',
              style: const TextStyle(fontSize: 16, color: Colors.orange),
            ),
            const SizedBox(height: 8),
            Text(
              'Số đánh giá: ${item['reviews']}',
              style: const TextStyle(fontSize: 16, color: Colors.orange),
            ),
            const SizedBox(height: 8),
            Text(
              'Trọng lượng: ${item['weight']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Màu sắc: ${item['color']}', // Hiển thị thông tin màu sắc mới
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Mô tả: ${item['description']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Các thông tin khác nếu có
          ],
        ),
      ),
    );
  }
}
