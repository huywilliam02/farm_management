import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/page/wage/create_formwage.dart';

import '../../controllers/wage/wage_controller.dart';

class WageView extends BaseView<WageController> {
  const WageView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Get.back();
              },
            ),
            const SizedBox(
              width: 20,
            ),
            const Expanded(
              flex: 18,
              child: Center(
                child: Text(
                  'Quản lý bảng lương',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Get.toNamed(Routes.MORE_LAND);
                Get.to(() => const CreateFromWWage());
              },
            ),
            const Expanded(child: SizedBox())
          ],
        )),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Tìm kiếm",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Bảng lương 8/1/2023 - 8/31/2023",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Nhân công : 5"),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 30,
                                width: 120,
                                decoration:
                                    const BoxDecoration(color: Colors.red),
                                child: const Center(
                                    child: Text(
                                  "Chưa hoàn thành",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14),
                                )),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Expanded(
                                child: Text(
                                  "50,800,000 đ",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Bảng lương 7/1/2023 - 7/31/2023",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Nhân công : 5"),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 30,
                                width: 100,
                                decoration:
                                    const BoxDecoration(color: Colors.blue),
                                child: const Center(
                                    child: Text(
                                  "Đã hoàn thành",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14),
                                )),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              const Expanded(
                                child: Text(
                                  "40,800,000 đ",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Bảng lương 6/1/2023 - 6/30/2023",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Nhân công : 5"),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 30,
                                width: 100,
                                decoration:
                                    const BoxDecoration(color: Colors.blue),
                                child: const Center(
                                    child: Text(
                                  "Đã hoàn thành",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14),
                                )),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              const Expanded(
                                child: Text(
                                  "40,800,000 đ",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Bảng lương 5/1/2023 - 5/31/2023",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Nhân công : 4"),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 30,
                                width: 100,
                                decoration:
                                    const BoxDecoration(color: Colors.blue),
                                child: const Center(
                                    child: Text(
                                  "Đã hoàn thành",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14),
                                )),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              const Expanded(
                                child: Text(
                                  "31,300,000 đ",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ))
      ],
    ));
  }
}
