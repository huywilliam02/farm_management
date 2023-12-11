import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/contract/contact_controller.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';

class CustomtabbarView extends BaseView<ContactController> {
  const CustomtabbarView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.background_color,
        body: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              Material(
                child: Container(
                  height: 50,
                  color: Colors.white,
                  child: TabBar(
                    isScrollable: true,
                    physics: const ScrollPhysics(),
                    unselectedLabelColor: Colors.black,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    tabs: [
                      Tab(
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Khách hàng"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Nhà cung cấp"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Nhân viên"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Người khác"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Obx(
                      () => controller.isLoading.value
                          ? const Center(
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(
                                  strokeWidth: 5,
                                  color: Colors.greenAccent,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            )
                          : ListView.separated(
                              padding: const EdgeInsets.all(15),
                              itemCount: controller.listClient.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                              itemBuilder: (context, index) {
                                final item = controller.listClient[index];
                                return ListTile(
                                  onTap: () {},
                                  title: Text(
                                    controller.listClient[index].name,
                                    style: GoogleFonts.roboto(
                                      // textStyle: Theme.of(context).textTheme.displayLarge,
                                      textStyle:
                                          TextStyleConstant.black22RobotoBold,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Số điện thoại : ${controller.listClient[index].name}",
                                    style: GoogleFonts.roboto(
                                      // textStyle: Theme.of(context).textTheme.displayLarge,
                                      textStyle:
                                          TextStyleConstant.grey16RobotoBold,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  trailing: const Icon(Icons.navigate_next),
                                );
                              },
                            ),
                    ),
                    Obx(
                      () => controller.isLoading.value
                          ? const Center(
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(
                                  strokeWidth: 5,
                                  color: Colors.greenAccent,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            )
                          : ListView.separated(
                              padding: const EdgeInsets.all(15),
                              itemCount: controller.listSupplier.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                              itemBuilder: (context, index) {
                                final item = controller.listSupplier[index];
                                return ListTile(
                                  title: Text(
                                    controller.listSupplier[index].name,
                                    style: GoogleFonts.roboto(
                                      // textStyle: Theme.of(context).textTheme.displayLarge,
                                      textStyle:
                                          TextStyleConstant.black22RobotoBold,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Số điện thoại : ${controller.listSupplier[index].name}",
                                    style: GoogleFonts.roboto(
                                      // textStyle: Theme.of(context).textTheme.displayLarge,
                                      textStyle:
                                          TextStyleConstant.grey16RobotoBold,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  trailing: const Icon(Icons.navigate_next),
                                );
                              },
                            ),
                    ),
                    Obx(
                      () => controller.isLoading.value
                          ? const Center(
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(
                                  strokeWidth: 5,
                                  color: Colors.greenAccent,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            )
                          : ListView.separated(
                              padding: const EdgeInsets.all(15),
                              itemCount: controller.listClient.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                              itemBuilder: (context, index) {
                                final item = controller.listClient[index];
                                return ListTile(
                                  onTap: () {},
                                  title: Text(
                                    controller.listClient[index].name,
                                    style: GoogleFonts.roboto(
                                      // textStyle: Theme.of(context).textTheme.displayLarge,
                                      textStyle:
                                          TextStyleConstant.black22RobotoBold,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  subtitle:
                                      Text(controller.listClient[index].name),
                                  trailing: const Icon(Icons.navigate_next),
                                );
                              },
                            ),
                    ),
                    Obx(
                      () => controller.isLoading.value
                          ? const Center(
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(
                                  strokeWidth: 5,
                                  color: Colors.greenAccent,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            )
                          : ListView.separated(
                              padding: const EdgeInsets.all(15),
                              itemCount: controller.listOtherObject.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                              itemBuilder: (context, index) {
                                final item = controller.listOtherObject[index];
                                return ListTile(
                                  onTap: () {},
                                  title: Text(
                                    controller.listOtherObject[index].name,
                                    style: GoogleFonts.roboto(
                                      // textStyle: Theme.of(context).textTheme.displayLarge,
                                      textStyle:
                                          TextStyleConstant.black22RobotoBold,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Số điện thoại : ${controller.listOtherObject[index].name}",
                                    style: GoogleFonts.roboto(
                                      // textStyle: Theme.of(context).textTheme.displayLarge,
                                      textStyle:
                                          TextStyleConstant.grey16RobotoBold,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  trailing: const Icon(Icons.navigate_next),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
