import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/page/main_tabview/main_tabview_view.dart';
import 'package:itfsd/presentation/page/shoppings/harvest_bill_view.dart';
import 'package:itfsd/presentation/page/shoppings/harvest_menu.dart';
import 'package:itfsd/presentation/page/shoppings/showbottom_shop.dart';

import '../../controllers/shoppings/shoppings_controller.dart';

class ShoppingsView extends BaseView<ShoppingsController> {
  const ShoppingsView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    final List<Map<String, dynamic>> customList = [
      {
        'name': 'Khách lẻ',
        'k': "BH00005",
        't': "170,000 đ",
        'y': "29/8/2023",
        'd': "Đã xuất hàng",
        'l': "Đã thanh toán",
      },
      {
        'name': 'Khách lẻ',
        'k': "BH00004",
        't': "85,800,000 đ",
        'y': "25/8/2023",
        'd': "Đã xuất hàng",
        'l': "Đã thanh toán",
      },
      {
        'name': 'Công ty Rượu Thành Long',
        'k': "BH00003",
        't': "579.000 đ",
        'y': "22/8/2023",
        'd': "Đã xuất hàng",
        'l': "Đã thanh toán",
      },
      {
        'name': 'Công ty Rượu Thành Long',
        'k': "BH00002",
        't': "29,370,000 đ",
        'y': "29/6/2023",
        'd': "Đã xuất hàng",
        'l': "Đã thanh toán",
      },
      {
        'name': 'Công ty Thực Phẩm HG',
        'k': "BH00001",
        't': "45,350,000 đ",
        'y': "29/6/2023",
        'd': "Đã xuất hàng",
        'l': "Đã thanh toán",
      },
    ];

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Get.off(() => MainTabView());
                },
              ),
              const Expanded(
                flex: 16,
                child: Center(
                  child: Text(
                    'Danh sách bán hàng',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                  ),
                ),
              ),
              const Expanded(child: SizedBox())
            ],
          )),
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
                      "Đơn bán 5/5 ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
                        IconButton(
                            onPressed: () {
                              Get.to(() => const HarvestBillView());
                            },
                            icon: const Image(
                                image:
                                    AssetImage("assets/icons/filtration.png"))),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                builder: (context) {
                                  return const ShowBottomShop();
                                },
                              );
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
                    Get.offAll(() => const HarvestMenuShoppingView());
                    // controller.showData(controller.listFarm.value[index]);
                  },
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Mã hàng : " + item['k'],
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                color: Colors.blue,
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
                                      item['d'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 25,
                                width: 150,
                                color: Colors.grey,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset("assets/icons/truck.png"),
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
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
