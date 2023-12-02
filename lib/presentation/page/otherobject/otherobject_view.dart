import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/page/otherobject/more_OtherObject_view.dart';
import 'package:itfsd/app/components/buttons/list_icon_phone_number.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';

import '../../controllers/otherobject/otherobject_controller.dart';

class OtherobjectView extends BaseView<OtherobjectController> {
  const OtherobjectView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        await Get.find<OtherobjectController>().refeshData();
      },
      child: CommonScaffold(
        backgroundColor: ColorConstant.background_color,
        appBar: CommonAppBar(
          title: 'Đối tượng khác',
          titleType: AppBarTitle.text,
          titleTextStyle: AppTextStyle.textTitleAppBar,
          centerTitle: true,
          leadingIcon: const Icon(Icons.arrow_back_ios_new),
          onLeadingPressed: () {
            Get.offAll(() => const ListIconPhoneNumber());
          },
          actions: [
            IconButton(
                onPressed: () {
                  controller.refeshForm();
                  Get.to(() => MoreOtherObjectView());
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: Column(
          children: [
            const CommonDivider(),
            const TextField(
              decoration: InputDecoration(
                hintText: "Tìm kiếm",
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const CommonDivider(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hiện thị :  2",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Image(
                          height: 30,
                          image: AssetImage("assets/icons/filter.png"),
                        ),
                      ),
                    ],
                  ),
                ],
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
                              controller:
                                  controller.otherobjectscrollController,
                              primary: false,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.showData(
                                      controller.listOtherObject.value[index],
                                    );
                                  },
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
                                                            .listOtherObject[
                                                                index]
                                                            .name,
                                                        style:
                                                            GoogleFonts.roboto(
                                                          // textStyle: Theme.of(context).textTheme.displayLarge,
                                                          textStyle:
                                                              TextStyleConstant
                                                                  .black22RobotoBold,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        ),
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
                                                      "SĐT : ${controller.listOtherObject[index].phoneNumber}",
                                                      style: GoogleFonts.roboto(
                                                        // textStyle: Theme.of(context).textTheme.displayLarge,
                                                        textStyle:
                                                            TextStyleConstant
                                                                .grey16RobotoBold,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            "Dư nợ : ${controller.listOtherObject[index].debt.toInt()}đ",
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
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const CommonDivider(),
                              itemCount:
                                  controller.listOtherObject.value.length,
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
    );
  }
}
