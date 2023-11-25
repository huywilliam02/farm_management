import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/page/customer/customer_pageview.dart';
import 'package:itfsd/app/components/buttons/list_icon_view_tree.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';

import '../../controllers/customer/customer_controller.dart';

class CustomerView extends BaseView<CustomerController> {
  const CustomerView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    final List<Map<String, dynamic>> customList = [
      {
        'name': 'Đoàn khách từ TP. Hồ Chí Minh',
        'k': "10",
        'y': "10/8/2023",
        'd': "Đã thăm quan",
      },
      {
        'name': 'Khách đoàn',
        'k': "20",
        'y': "8/8/2023",
        'd': "Đã thăm quan",
      },
      {
        'name': 'Đại học Lạc Hồng',
        'k': "5",
        'y': "2/8/2023",
        'd': "Đã thăm quan",
      },
      {
        'name': 'Công ty Rượu Thành Long',
        'k': "BH00002",
        'y': "25/6/2023",
        'd': "Đã thăm quan",
      },
      {
        'name': 'Đoàn khách từ Đồng Nai',
        'k': "30",
        'y': "2/6/2023",
        'd': "Đã thăm quan",
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
                    Get.offAll(() => const ListIconTreeView());
                  },
                ),
                const Expanded(
                  flex: 16,
                  child: Center(
                    child: Text(
                      'Danh sách khách thăm quan',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
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
                        "Khách thăm quan 8/9 ",
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
                                Get.to(() => MoreCustomerView());
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
              child: Obx(
                () => controller.isLoading.value
                    ? Center(
                        child: SizedBox(
                          height: UtilsReponsive.height(context, 40),
                          width: UtilsReponsive.width(context, 40),
                          child: const CircularProgressIndicator(
                            strokeWidth: 5,
                            color: Colors.greenAccent,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              controller: controller.customerscrollController,
                              primary: false,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.showData(
                                        controller.listCustomer.value[index]);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .listCustomer[index].name,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Số lượng : ${controller.listCustomer[index].quantity}",
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 180,
                                                  color: Colors.green,
                                                  child: Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Image.asset(
                                                          "assets/icons/customerservice.png"),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        controller.dropdownValue.value =
                                                        controller.listCustomer[index].status == 1 ? controller.listStatusDropdown.first : controller.listStatusDropdown.last,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  controller.listCustomer[index]
                                                      .receptionDay,
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                color: Colors.grey,
                                indent: 1,
                                height: 4,
                              ),
                              itemCount: controller.listCustomer.value.length,
                            ),
                          ),
                          controller.lazyLoading.value
                              ? const CircularProgressIndicator(
                                  strokeWidth: 5,
                                  color: Colors.greenAccent,
                                  backgroundColor: Colors.grey,
                                )
                              : const SizedBox()
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
