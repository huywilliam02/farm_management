import 'package:get/get.dart';
import 'package:itfsd/base/base_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWarehouseController extends BaseController {
  //TODO: Implement ChartWarehouseController
  late TooltipBehavior tooltipBehavior;
  late TooltipBehavior tooltipBehaviorw;
  final count = 0.obs;
  @override
  void onInit() {
    tooltipBehavior =  TooltipBehavior(enable: true);
    tooltipBehaviorw =  TooltipBehavior(enable: true);
    super.onInit();
  }



  void increment() => count.value++;
}
