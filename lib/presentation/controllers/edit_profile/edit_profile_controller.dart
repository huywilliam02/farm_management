
import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/data/database/database_local.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:itfsd/data/model/login/login_model.dart';
import 'package:itfsd/data/network/api/edit_profile/editprofile.dart';

class EditProfileController extends BaseController {
  //TODO: Implement EditProfileController
  Rx<bool> isLoading = false.obs;
  // late Rx<LoginModel> loginModel;
  Rx<LoginModel?> loginModel = Rx<LoginModel?>(null);
  Rx<String> userName = "".obs;
  Rx<String> fullName = "".obs;
  String accessToken = "";

  final count = 0.obs;



  @override
  Future<void> onInit() async {
    // if (Get.find<LoginController>().loginModel.value != null) {
    //   userName.value = Get.find<LoginController>().loginModel.value!.username ?? "";
    //   fullName.value = Get.find<LoginController>().loginModel.value!.fullName ?? "";
    // }
    getEditUser();
    super.onInit();
  }

  Future<void> getEditUser() async {
    isLoading.value = true;
    try {
      loginModel.value = await EditProfilelApi.getDataUser(accessToken);
      userName.value = loginModel.value!.username ?? "";
      fullName.value = loginModel.value!.fullName ?? "";
    } catch (e) {
      print("Error fetching user data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  logout() async {
    await DatabaseLocal.instance.removeJwtToken();
    Get.offAllNamed(Routes.LOGIN);
  }

  void increment() => count.value++;
}
