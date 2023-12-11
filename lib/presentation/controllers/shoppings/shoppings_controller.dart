import 'package:get/get.dart';
import 'package:itfsd/base/base_controller.dart';

class ShoppingsController extends BaseController {
  //TODO: Implement ShoppingsController

  final count = 0.obs;
  var selectedItem = {}.obs;

  void setSelectedItem(Map<String, dynamic> item) {
    selectedItem.value = item;
  }


  void increment() => count.value++;
}
