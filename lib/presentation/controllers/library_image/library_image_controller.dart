import 'package:itfsd/base/base_controller.dart';
import 'package:get/get.dart';

class LibraryImageController extends BaseController {
  //TODO: Implement LibraryImageController
  LibraryImageController({required this.images});
  RxList<String> images;
  final indexChoose = 0.obs;

  onTapImage(int index) {
    indexChoose(index);
  }
}
