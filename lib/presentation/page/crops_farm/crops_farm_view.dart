import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/page/crops_farm/more_tree.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';

import '../../controllers/crops_farm/crops_farm_controller.dart';

class CropsFarmView extends BaseView<CropsFarmController> {
  const CropsFarmView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Get.find<CropsFarmController>().refeshData();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () async {
                        Get.back();
                      },
                    )),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          'Cây trồng nông trại',
                          style: AppTextStyle.textTitleAppBar,
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          controller.refeshForm();
                          Get.to(() => MoretreeView());
                        },
                        icon: const Icon(Icons.add),
                      ),
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
                  await controller.onTypingSearchCropsFarm(value);
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
                                controller: controller.cropsscrollController,
                                primary: false,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.showData(
                                        controller.listCropsFarm.value[index],
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          // Image.network(
                                          //   HttpNetWorkUrlApi.baseURL +
                                          //       controller.listCropsFarm[index]
                                          //           .images.first,
                                          //   fit: BoxFit.cover,
                                          //   height: 50,
                                          //   width: 50,
                                          // ),
                                          SizedBox(
                                            width: UtilsReponsive.width(
                                                context, 15),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: UtilsReponsive.height(
                                                      context, 10),
                                                ),
                                                Text(
                                                  controller
                                                      .listCropsFarm[index]
                                                      .name,
                                                  style: AppTextStyle.textNameData,
                                                ),
                                                SizedBox(
                                                  height: UtilsReponsive.height(
                                                      context, 10),
                                                ),
                                                Text(
                                                  "Thời gian thu hoạch : ${controller.listCropsFarm[index].harvest}",
                                                  style: AppTextStyle.textDateTime,
                                                ),
                                                SizedBox(
                                                  height: UtilsReponsive.height(
                                                      context, 10),
                                                ),
                                                // Text(
                                                //   "Loại bệnh thường gặp : ${controller.listCropsFarm[index].disease}",
                                                //   style: AppTextStyle.textDateTime,
                                                // ),
                                                SizedBox(
                                                  height: UtilsReponsive.height(
                                                      context, 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Image.asset(
                                            "assets/icons/next.png",
                                            height: UtilsReponsive.height(
                                                context, 15),
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: UtilsReponsive.width(
                                                context, 20),
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
                                itemCount:
                                    controller.listCropsFarm.value.length,
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
