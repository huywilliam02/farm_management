import 'package:itfsd/base/base_controller.dart';
import 'package:itfsd/presentation/controllers/edit_profile/edit_profile_controller.dart';
import 'package:itfsd/presentation/page/edit_profile/edit_profile_view.dart';
import 'package:itfsd/presentation/controllers/farm/farm_controller.dart';
import 'package:itfsd/presentation/controllers/home/home_controller.dart';
import 'package:itfsd/presentation/page/farm/farm_view.dart';
import 'package:itfsd/presentation/page/home/home_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/components/buttons/tab_view_diary.dart';

class MainTabviewController extends BaseController {
  var selectedIndex = 0.obs;
  RxString page = 'home'.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // Get.updateLocale(Locale("vi"));
    // Get.find<TabController>();
  }



  RxList<Widget> body = RxList([
    const HomeView(),
    const FarmView(),
    const ListIcondirayView(),
    const EditProfileView()
  ]);
  onItemTapped(String index) {
    page.value = index;
    switch (page.value) {
      case 'home':
        Get.find<HomeController>();
        return selectedIndex.value = 0;
      case 'farm':
        Get.find<FarmController>();
        return selectedIndex.value = 1;
      case 'diray':
        Get.find<ListIcondirayView>();
        return selectedIndex.value = 2;
      case 'mine':
        Get.find<EditProfileController>();
        return selectedIndex.value = 3;
      default:
        return selectedIndex.value = 0;
    }
  }

  onItemTapped1(int index) {
    switch (index) {
      case 0:
        Get.find<HomeController>();
        return selectedIndex.value = 0;
      case 1:
        Get.find<FarmController>();
        return selectedIndex.value = 1;
      case 2:
        Get.find<EditProfileController>();
        return selectedIndex.value = 2;
      case 3:
        Get.find<EditProfileController>();
        // Get.to(TabMineView());
        // return null;
        return selectedIndex.value = 3;
      default:
        return selectedIndex.value = 0;
    }
  }

  // onSelectedTrackingView(BuildContext context) async {
  //   await testRequestLocationPermission();

  //   locat.Location location = locat.Location();
  //   if (await Permission.location.isGranted &&
  //       await location.serviceEnabled()) {
  //     Get.toNamed(Routes.HOME);
  //   } else {
  //     QuickAlert.show(
  //       context: Get.context!,
  //       // title:LocaleKeys.common_location.tr,
  //       title: 'test',
  //       // text: LocaleKeys.common_accept_location_irace.tr,
  //       text: 'ví',
  //       type: QuickAlertType.warning,
  //       confirmBtnText: "OK",
  //       onConfirmBtnTap: () async {
  //         Get.back();
  //         await testRequestLocationPermission();
  //       },
  //       cancelBtnText: "Cancel",
  //       showCancelBtn: true,
  //       onCancelBtnTap: () {
  //         Get.back();
  //       },
  //     );
  //   }
  // }

//   Future<void> testRequestLocationPermission() async {
//     PermissionStatus locationStatus = await Permission.location.request();
//     print("locationStatus" + locationStatus.toString());
//     if (locationStatus != PermissionStatus.granted) {
// //Show thông báo

//       if (locationStatus == PermissionStatus.denied) {
//         await QuickAlert.show(
//             // title: LocaleKeys.common_location.tr,
//             title: 'sdhjdj',
//             // text: LocaleKeys.common_need_accept.tr,
//             text: 'sjsj',
//             context: Get.context!,
//             type: QuickAlertType.warning,
//             // confirmBtnText:LocaleKeys.common_need_accept.tr,
//             confirmBtnText: 'doen',
//             onConfirmBtnTap: () async {
//               Get.back();
//               await Permission.location.request();
//             },
//             onCancelBtnTap: () {
//               Get.back();
//             },
//             showCancelBtn: true);
//       } else if (locationStatus == PermissionStatus.permanentlyDenied) {
//         //Show thông báo Bị từ chối vĩnh viễn
//         await QuickAlert.show(
//             // title: LocaleKeys.common_location_off_parmanent.tr,
//             title: "h",
//             // text:
//             //     "${LocaleKeys.common_open_app_setting.tr}""\n""${LocaleKeys.common_permission_app.tr}""\n" "${LocaleKeys.common_location_permiss.tr}""\n""${LocaleKeys.common_location_always.tr}",
//             context: Get.context!,
//             type: QuickAlertType.warning,
//             // confirmBtnText: LocaleKeys.common_allow.tr,
//             confirmBtnText: 'h',
//             onConfirmBtnTap: () async {
//               Get.back();
//               await openAppSettings();
//             },
//             onCancelBtnTap: () {
//               Get.back();
//             },
//             showCancelBtn: true);
//       }
//     }
//   }
}
