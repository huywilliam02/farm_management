import 'package:flutter/material.dart';

class DiaryView extends StatefulWidget {
  const DiaryView({Key? key}) : super(key: key);
  @override
  State<DiaryView> createState() => _DiaryViewState();
}

class _DiaryViewState extends State<DiaryView> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> customList = [
      {
        'n': "Dưa hấu",
        'name': '15/06/2023',
        'k': "100",
      },
      {
        'n': "Dưa lưới",
        'name': '15/06/2023',
        'k': "1000",
      },
      {
        'n': "Dưa hấu",
        'name': '15/06/2023',
        'k': "500",
      },
      {
        'n': "Dưa hấu",
        'name': '15/06/2023',
        'k': "100",
      },
      {
        'n': "Dưa hấu",
        'name': '15/06/2023',
        'k': "98",
      },
      {
        'n': "Dưa hấu",
        'name': '15/06/2023',
        'k': "57",
      },
      {
        'n': "Dưa hấu",
        'name': '15/06/2023',
        'k': "120",
      },
      {
        'n': "Dưa lưới",
        'name': '15/06/2023',
        'k': "80",
      },
      {
        'n': "Dưa lưới",
        'name': '15/06/2023',
        'k': "50",
      },
    ];

    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Material(
            child: Container(
              height: 50,
              color: Colors.white,
              child: TabBar(
                isScrollable: true,
                physics: const ScrollPhysics(),
                unselectedLabelColor: Colors.black,
                labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey),
                tabs: [
                  Tab(
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text("Nông sản"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text("Vật nuôi"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView.separated(
                  padding: const EdgeInsets.all(15),
                  itemCount: customList.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (context, index) {
                    final item = customList[index];
                    return InkWell(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Sản phẩm : " + item['n'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            item['name'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Số lượng : " + item['k'],
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w200,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 25,
                                width: 150,
                                color: Colors.green,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                        "assets/icons/directmarketing.png"),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      // item['l'],
                                      "Bán trực tiếp",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              )
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Sản phẩm : Dưa lưới",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  // item['name'],
                                  "20/6/2023",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Số lượng : 200",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 25,
                      width: 150,
                      color: Colors.blue,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset("assets/icons/smartfarm.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            // item['l'],
                            "Thu về kho",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    )
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
