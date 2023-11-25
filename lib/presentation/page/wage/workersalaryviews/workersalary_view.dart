import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/wage/workersalarycontrollers/workersalary_controller.dart';


class WorkersalaryView extends BaseView<WorkersalaryController> {
  const WorkersalaryView({Key? key}) : super(key: key);
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
                  'Danh sách nhân công',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Get.toNamed(Routes.MORE_LAND);
                // Get.to(() => const CreateFromWWage());
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
        const Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Đặng Văn Huy",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text("Ngày nhân công : 25"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "20,800,000 đ",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "28,800,000 đ",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Nguyễn Đức Thiên",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text("Ngày nhân công : 25"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "20,800,000 đ",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "26,800,000 đ",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Nguyễn Văn Nhơn",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text("Ngày nhân công : 25"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "20,800,000 đ",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "25,800,000 đ",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Nguyễn Thiên Ân",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text("Ngày nhân công : 25"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "20,800,000 đ",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "27,800,000 đ",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
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
