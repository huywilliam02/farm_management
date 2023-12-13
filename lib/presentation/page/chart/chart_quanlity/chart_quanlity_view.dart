import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../controllers/chart/chart_quanlity/chart_quanlity_controller.dart';

class ChartQuanlityView extends BaseView<ChartQuanlityController> {
  const ChartQuanlityView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData(1, 'Tháng 1', 1035, 894),
      ChartData(2, "Tháng 2", 1235, 578),
      ChartData(3, "Tháng 3", 790, 689),
      ChartData(4, "Tháng 4", 605, 937),
      ChartData(5, "Tháng 5", 790, 300),
      ChartData(6, "Tháng 6", 590, 700),
      ChartData(7, "Tháng 7", 991, 800),
      ChartData(8, "Tháng 8", 790, 300),
      ChartData(9, "Tháng 9", 799, 500),
      ChartData(10, "Tháng 10", 991, 803),
      ChartData(11, "Tháng 11", 391, 201),
      ChartData(12, "Tháng 12", 0, 0),
    ];
    return Scaffold(
      backgroundColor: ColorConstant.background_color,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
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
                    flex: 3,
                    child: Center(
                      child: Text(
                        'Thống kê sản lượng',
                        style: AppTextStyle.textTitleAppBar,
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox())
                ],
              ),
            ),
            const Divider(
              height: 2,
              thickness: 2,
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
              children: [
                  Text(
                    "Tổng: 158,590,000",
                    style: GoogleFonts.roboto(
                      // textStyle: Theme.of(context).textTheme.displayLarge,
                      textStyle: TextStyleConstant
                          .grey16RobotoBold,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
              ],
            ),
                )),
            Expanded(
              flex: 5,
              child: SizedBox(
                child: SfCartesianChart(
                  legend:
                      const Legend(isVisible: true, position: LegendPosition.bottom),
                  tooltipBehavior: controller.tooltipBehavior,
                  primaryXAxis: CategoryAxis(),
                  title: ChartTitle(
                    text: 'Tổng tiền theo tháng',
                    alignment: ChartAlignment.near,
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontSize: 14,
                    ),
                  ),
                  palette: const <Color>[
                    Colors.blueAccent,
                    Colors.grey,
                  ],
                  series: <ChartSeries>[
                    // Renders column chart
                    ColumnSeries<ChartData, String>(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.name,
                        yValueMapper: (ChartData data, _) => data.y,
                        // Sorting based on the specified field
                        name: "2023",
                        sortFieldValueMapper: (ChartData data, _) => data.name),
                    ColumnSeries<ChartData, String>(
                        dataSource: chartData,
                        trackColor: Colors.grey,
                        name: "2022",
                        xValueMapper: (ChartData data, _) => data.name,
                        sortFieldValueMapper: (ChartData data, _) => data.name,
                        yValueMapper: (ChartData data, _) => data.y1),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 8,
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.name, this.y, this.y1);
  final int x;
  final String name;
  final double y;
  final double y1;
}
