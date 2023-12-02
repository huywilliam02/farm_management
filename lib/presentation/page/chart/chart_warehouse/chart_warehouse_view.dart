import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/data/model/chart/chart_warehouse/statistics_warehouse.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../controllers/chart/chart_warehouse/chart_warehouse_controller.dart';

class ChartWarehouseView extends BaseView<ChartWarehouseController> {
  const ChartWarehouseView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () async {
                      Get.back();
                    },
                  )),
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: Text(
                        'Thống kê kho',
                        style: GoogleFonts.roboto(
                          // textStyle: Theme.of(context).textTheme.displayLarge,
                          textStyle: TextStyleConstant.black22RobotoBold,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox())
                ],
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              SizedBox(
                child: SfCircularChart(
                  // Enables the legend
                  title: ChartTitle(
                    text: 'Hàng tồn kho',
                    alignment: ChartAlignment.near,
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        // fontStyle: FontStyle.italic,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  legend:
                      const Legend(isVisible: true, position: LegendPosition.bottom),
                  tooltipBehavior: controller.tooltipBehaviorw,
                  series: <CircularSeries<StatisticsWareHouseModel, String>>[
                    // Initialize line series
                    PieSeries<StatisticsWareHouseModel, String>(
                        dataSource: [
                          // Bind data source
                          StatisticsWareHouseModel('Kho hàng hóa', 50),
                          StatisticsWareHouseModel('Kho nguyên liệu', 28),
                          StatisticsWareHouseModel('Kho thu hoạch', 34),
                          StatisticsWareHouseModel('Vật tư', 10),
                        ],
                        xValueMapper: (StatisticsWareHouseModel sales, _) =>
                            sales.year,
                        yValueMapper: (StatisticsWareHouseModel sales, _) =>
                            sales.sales,
                        name: 'Tổng số lượng',
                        explode: true,
                        // First segment will be exploded on initial rendering
                        explodeIndex: 0,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Nhập hàng",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          // fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: UtilsReponsive.height(context, 10),
                        ),
                        const Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Tổng",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "150",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Kho hàng hóa",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "28",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Kho nguyên liệu",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "34",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Kho thu hoạch",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "90",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Nhập kho",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "120",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Đang cất hàng",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "80",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Xuất hàng ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          // fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: UtilsReponsive.height(context, 10),
                        ),
                        const Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Tổng",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "100",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Kho hàng hóa",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "28",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Kho nguyên liệu",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "34",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Kho thu hoạch",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "90",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Đang lấy hàng",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "20",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Đang chờ xuất",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "45",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Đã xuất kho",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "60",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: SfCircularChart(
                  // Enables the legend
                  title: ChartTitle(
                    text: 'Đề xuất xuất vật tư',
                    alignment: ChartAlignment.near,
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        // fontStyle: FontStyle.italic,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  legend:
                      const Legend(isVisible: true, position: LegendPosition.bottom),
                  tooltipBehavior: controller.tooltipBehavior,
                  series: <CircularSeries<StatisticsWareHouseModel, String>>[
                    // Initialize line series
                    DoughnutSeries<StatisticsWareHouseModel, String>(
                      dataSource: [
                        // Bind data source
                        StatisticsWareHouseModel('Phiếu đã duyệt', 30),
                        StatisticsWareHouseModel('Phiếu chờ duyệt', 18),
                        StatisticsWareHouseModel('Đã hủy phiếu', 5),
                      ],
                      xValueMapper: (StatisticsWareHouseModel sales, _) =>
                          sales.year,
                      yValueMapper: (StatisticsWareHouseModel sales, _) =>
                          sales.sales,
                      name: 'Tổng số lượng',
                      explode: true,
                      // First segment will be exploded on initial rendering
                      explodeIndex: 0,
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
