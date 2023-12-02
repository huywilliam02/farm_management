import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      },
      {
        'name': 'Hạt giống dưa hấu Super An Tiêm 037',
        'k': "150 Gói",
        'img':
            "https://phudienseed.com.vn/wp-content/uploads/2022/11/z3865941077773_d1bbb871919a1095538b3e207fcd4b5a-768x1093.jpg",
      },
      {
        'name':
            'Thức ăn cá tra Cargill 7605 18% đạm cho cá ăn hoặc dùng câu cá cám cá',
        'k': "200 Bao",
        'img':
            "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcS1xlvuuaSu2N4HpYXmtK8Hj4_JDI_2RGKNxWFvELVipggqembyI8dBOVunvFw1W89uq2G3c0cpU6jaGFDk6_ELB_bRclpSL-yzgW3T5PA&usqp=CAc",
      },
      {
        'name':
            'Thức Ăn Cho Cá Cargill 1 Đến 6 Mm Thích Hợp Nuôi Các Loại Cá Nước Ngọt',
        'k': "150 Bao",
        'img':
            "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTiSMz1QKsaDC-z3R2K47G5pKjIadssyXDx2XPvIaAfOIoG5nitgPycohFsKusuDIKityImlvIqRnXDpixSeNe1FW1_oQPdku-LuPdklrg&usqp=CAE",
      },
      {
        'name':
            'Promin Gold kích thích bắt mồi bổ sung dưỡng chất dùng cho nuôi trồng',
        'k': "75 lọ",
        'img':
            "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTasRA2o_ql3MiBZitSjtGad7d4XTtPpq_0li2ocTkNJ11CQxdnviSVqHs_6EGdSJNrNcCRnw8-5PKhQJezTA5Sjfhhgw0brD9q322eh1DB6FVeG4mmQP-2SQ&usqp=CAE",
      },
      {
        'name': '	lansy post, thức ăn cho tôm cá 1lon 1,250kg',
        'k': "50 Hộp",
        'img':
            "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcS7eVsW0NCGSXNeY46sGtadtRrnT3_9w_7k0oPz-gr47ZbMcNq6t6JbfzemHjeJbfyDqWHhN3VOL7nZ8omS0WLzb1fuJD4XysEWP57ZM9IZ&usqp=CAE",
      },
      {
        'name':
            'AG 300 - THỨC ĂN HỖN HỢP CAO CẤP DẠNG VIÊN (DÙNG CHO GÀ TỪ 1 ĐẾN 22 NGÀY)',
        'k': "50 Bao",
        'img':
            "http://thienbangvn.com/uploads/product/THIENBANG_GIA_CAM/AG_300.png",
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Get.back();
                  },
                ),
                const Center(
                    child: Text(
                  'Hàng hóa tồn kho (9)',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                )),
                IconButton(
                  onPressed: () {
                    // controller.refeshForm();
                    Get.to(const Createstorewarehouse());
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
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
                        Get.to(() => const Editstorewarehouse());
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
