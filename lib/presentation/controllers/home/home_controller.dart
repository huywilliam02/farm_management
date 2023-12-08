import 'package:get/get.dart';
import 'package:itfsd/data/model/editprofile/edit_profile.dart';
import 'package:itfsd/data/model/login/login_model.dart';
import 'package:itfsd/data/network/api/edit_profile/editprofile.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  Rx<String> avatar = "".obs;
  Rx<bool> isLoading = false.obs;
  String accessToken = "";
  Rx<LoginModel?> loginModel = Rx<LoginModel?>(null);

  @override
  Future<void> onInit() async {
    getEditUser();
    super.onInit();
  }

  Future<void> getEditUser() async {
    isLoading.value = true;
    try {
      loginModel.value = await EditProfilelApi.getDataUser(accessToken);
      avatar.value = loginModel.value!.avatar ?? "";
    } catch (e) {
      print("Error fetching user data: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
