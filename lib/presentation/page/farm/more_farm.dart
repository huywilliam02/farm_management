import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/farm/farm_controller.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreFarm extends BaseView<FarmController> {
  MoreFarm({Key? key, this.idFarm}) : super(key: key);
  String? idFarm;
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
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () async {
                      Get.toNamed(Routes.MAIN_TABVIEW);
                    },
                  ),
                  const  Expanded(
                    flex: 6,
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 18),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox())
                ],
              ),
            ),
            const Expanded(
              flex: 9,
              child: Center(
                child: Text("Bạn không có quyền truy cập",),
              ),),
            // Expanded(
            //   flex: 9,
            //   child: Obx(
            //     () => controller.isLoading.value
            //         ? const Center(
            //             child: SizedBox(
            //               height: 40,
            //               width: 40,
            //               child: CircularProgressIndicator(),
            //             ),
            //           )
            //         : ListView.separated(
            //             itemCount: controller.listFarm.length,
            //             separatorBuilder: (context, index) => const Divider(
            //               color: Colors.grey,
            //               indent: 1,
            //               height: 4,
            //             ),
            //             itemBuilder: (context, index) {
            //               return InkWell(
            //                 onTap: () {
            //                   controller
            //                       .showData(controller.listFarm.value[index]);
            //                 },
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(8.0),
            //                   child: Row(
            //                     children: [
            //                       Image.network(
            //                         HttpNetWorkUrlApi.baseURL +
            //                             controller.listFarm[index].image!,
            //                         height: 80,
            //                         width: 90,
            //                         fit: BoxFit.cover,
            //                       ),
            //                       const SizedBox(
            //                         width: 15,
            //                       ),
            //                       Expanded(
            //                         child: Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text(
            //                               controller.listFarm[index].name!,
            //                               style: const TextStyle(
            //                                   fontSize: 16,
            //                                   fontWeight: FontWeight.w700),
            //                             ),
            //                             const SizedBox(
            //                               height: 10,
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                       Image.asset(
            //                         "assets/icons/next.png",
            //                         height: 15,
            //                         color: Colors.grey,
            //                       ),
            //                       const SizedBox(
            //                         width: 10,
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //               );
            //             },
            //           ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
