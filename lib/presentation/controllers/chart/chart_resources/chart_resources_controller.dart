import 'package:get/get.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartResourcesController extends BaseController {
  //TODO: Implement ChartResourcesController

  late TooltipBehavior tooltipBehavior;
  final count = 0.obs;
  @override
  void onInit() {
    tooltipBehavior =  TooltipBehavior(enable: true);
    super.onInit();
  }



  void increment() => count.value++;
}
