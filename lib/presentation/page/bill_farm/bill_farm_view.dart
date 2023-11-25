import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/page/bill_farm/showbottom_bill.dart';
import 'package:itfsd/presentation/page/main_tabview/main_tabview_view.dart';

import '../../controllers/bill_farm/bill_farm_controller.dart';

class BillFarmView extends BaseView<BillFarmController> {
  const BillFarmView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    final List<Map<String, dynamic>> customList = [
      {
        'name': 'Tháng 7/2023',
        'k': "17091 kW",
        't': "32,170,000 đ",
        'y': "29/7/2023",
        'l': "Đã thanh toán",
      },
      {
        'name': 'Tháng 8/2023',
        'k': "7091 kW",
        't': "16,800,000 đ",
        'y': "25/9/2023",
        'l': "Đã thanh toán",
      },
      {
        'name': 'Tháng 9/2023',
        'k': "2091 kW",
        't': "5,900,000 đ",
        'y': "22/10/2023",
        'l': "Đã thanh toán",
      },
      {
        'name': 'Tháng 10/2023',
        'k': "8991 kW",
        't': "16,970,000 đ",
        'y': "29/10/2023",
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
                    'Hóa đơn',
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
                      "Hiện thị 5/5 ",
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
                              // Get.to(() => const HarvestBillView());
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
                                  return const ShowBottomBill();
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
                    // Get.offAll(() => const HarvestMenuShoppingView());
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
                                "Tiêu thu : " + item['k'],
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
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
