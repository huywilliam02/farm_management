import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/page/client_farm/more_client.dart';
import 'package:itfsd/app/components/buttons/list_icon_phone_number.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';

import '../../controllers/client_farm/client_farm_controller.dart';

class ClientFarmView extends BaseView<ClientFarmController> {
  const ClientFarmView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Get.find<ClientFarmController>().refeshData();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () {
                        Get.offAll(() => const ListIconPhoneNumber());
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 18,
                      child: Center(
                        child: Text(
                          'Khách hàng',
                          style: AppTextStyle.textTitleAppBar,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        controller.refeshForm();
                        Get.to(() => MoreClientView());
                      },
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              TextField(
                onChanged: (value) async {
                  await controller.onTypingSearchClient(value);
                },
                decoration: const InputDecoration(
                  hintText: "Tìm kiếm",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Hiện thị :  2",
                          style: AppTextStyle.textShowData,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Image(
                                image: AssetImage("assets/icons/filter.png"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Obx(
                  () => controller.isLoading.value
                      ? Center(
                          child: SizedBox(
                            height: UtilsReponsive.height(context, 40),
                            width: UtilsReponsive.width(context, 40),
                            child: const CircularProgressIndicator(
                              strokeWidth: 5,
                              color: Colors.greenAccent,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                primary: false,
                                controller:
                                    controller.clientFarmscrollController,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.showData(
                                        controller.listClient.value[index],
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            controller
                                                                .listClient[
                                                                    index]
                                                                .name,
                                                            style: AppTextStyle.textNameData,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "SĐT : ${controller.listClient[index].phoneNumber}",
                                                          style: GoogleFonts
                                                              .roboto(
                                                            // textStyle: Theme.of(context).textTheme.displayLarge,
                                                            textStyle:
                                                                TextStyleConstant
                                                                    .grey16RobotoBold,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Dư nợ : ${controller.listClient[index].debt.toInt()}đ",
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
                                              ),
                                              const SizedBox(
                                                width: 25,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(
                                  color: Colors.grey,
                                  indent: 1,
                                  height: 4,
                                ),
                                itemCount: controller.listClient.value.length,
                              ),
                            ),
                            controller.lazyLoading.value
                                ? const CircularProgressIndicator(
                                    strokeWidth: 5,
                                    color: Colors.greenAccent,
                                    backgroundColor: Colors.grey,
                                  )
                                : const SizedBox()
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
