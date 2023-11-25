import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/data/model/chart/chart_resources/resourcesModel.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../app/core/constants/app_constants.dart';
import '../../../controllers/chart/chart_resources/chart_resources_controller.dart';

class ChartResourcesView extends BaseView<ChartResourcesController> {
  const ChartResourcesView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
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
                        'Thống kê nông trại',
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
            ),
            const Divider(
              height: 2,
              thickness: 2,
            ),
            Expanded(
              flex: 9,
              child: SizedBox(
                child: SfCircularChart(
                  // Enables the legend
                  title: ChartTitle(
                      text: 'Tổng tài nguyên nông trại',
                      alignment: ChartAlignment.near,
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        // fontStyle: FontStyle.italic,
                        fontSize: 14,
                      )),
                  legend:
                      const Legend(isVisible: true, position: LegendPosition.bottom),
                  tooltipBehavior: controller.tooltipBehavior,
                  series: <CircularSeries<ResourceModel, String>>[
                    // Initialize line series
                    PieSeries<ResourceModel, String>(
                        dataSource: [
                          // Bind data source
                          ResourceModel('Nông trại', 50),
                          ResourceModel('Khu đất', 28),
                          ResourceModel('Vùng đất', 34),
                          ResourceModel('Nhân viên', 90),
                          ResourceModel('Vật tư', 52),
                        ],
                        xValueMapper: (ResourceModel sales, _) => sales.year,
                        yValueMapper: (ResourceModel sales, _) => sales.sales,
                        name: 'Tổng số lượng',
                        explode: true,
                        // First segment will be exploded on initial rendering
                        explodeIndex: 0,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                height: 90,
                color: Colors.white,
                child:  Row(
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
                          "Nông trại",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "50",
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
                          "Khu đất",
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
                          "Vùng đất",
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
                          "Nhân viên",
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
                    const Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Vật tư",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "52",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
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
