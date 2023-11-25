import 'package:itfsd/app/core/common/common_app_bar.dart';
import 'package:itfsd/app/core/common/common_scaffold.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/workinday/workinday_controller.dart';
import 'package:itfsd/app/core/common/form_field_widget.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MoreWorkInDayView extends BaseView<WorkindayController> {
  MoreWorkInDayView({Key? key, this.idWorkInDay}) : super(key: key);
  String? idWorkInDay;
  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: idWorkInDay != null
            ? "Chi tiết công việc trong ngày"
            : "Tạo công việc trong ngày",
        titleType: AppBarTitle.text,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        centerTitle: true,
        leadingIcon: const Icon(Icons.arrow_back_ios_new),
        onLeadingPressed: () {
          Get.back();
        },
        actions: [
          idWorkInDay != null
              ? IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    await QuickAlert.show(
                      context: context,
                      type: QuickAlertType.confirm,
                      title: "Bạn chắc chưa",
                      confirmBtnText: "OK",
                      cancelBtnText: "Chưa",
                      onConfirmBtnTap: () async {
                        await controller.deleteData(idWorkInDay!);
                      },
                    );
                  },
                )
              : const SizedBox(),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Obx(
                () => controller.isLoading.value
                    ? const CommonLoadingPageProgressIndicator()
                    : SingleChildScrollView(
                        padding: const EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: UtilsReponsive.height(context, 50),
                              ),
                              Text(
                                'Chọn vùng canh tác',
                                style: AppTextStyle.textTitleForm,
                              ),
                              SizedBox(
                                height: UtilsReponsive.height(context, 10),
                              ),
                              Obx(() {
                                controller.landId.value;
                                return _viewChooseLandDivision(context);
                              }),
                              SizedBox(
                                height: UtilsReponsive.height(context, 10),
                              ),
                              Text(
                                'Chọn loại cây trồng',
                                style: AppTextStyle.textTitleForm,
                              ),
                              SizedBox(
                                height: UtilsReponsive.height(context, 10),
                              ),
                              Obx(() {
                                controller.cropId.value;
                                return _viewChooseCropsfarm(context);
                              }),
                              SizedBox(
                                height: UtilsReponsive.height(context, 10),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Ngày thực hiện",
                                              style: AppTextStyle.textTitleForm,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: UtilsReponsive.height(
                                              context, 10),
                                        ),
                                        SizedBox(
                                          height: 70,
                                          child: GestureDetector(
                                            onTap: () async {
                                              await controller.chooseDate(true);
                                            },
                                            child: FormFieldWidget(
                                                isEnabled: false,
                                                suffixIcon: const Icon(
                                                    Icons.calendar_month),
                                                controllerEditting: controller
                                                    .implementatController,
                                                setValueFunc: () {}),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: UtilsReponsive.width(context, 30),
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Thời gian hoàn thành",
                                            style: AppTextStyle.textTitleForm,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            UtilsReponsive.height(context, 10),
                                      ),
                                      SizedBox(
                                        height: 70,
                                        child: FormFieldWidget(
                                          controllerEditting:
                                              controller.completedatController,
                                          setValueFunc:
                                              controller.setValueCompletedat,
                                        ),
                                      )
                                    ],
                                  )),
                                ],
                              ),
                              SizedBox(
                                height: UtilsReponsive.height(context, 10),
                              ),
                              Text(
                                'Công việc thực hiện',
                                style: AppTextStyle.textTitleForm,
                              ),
                              SizedBox(
                                height: UtilsReponsive.height(context, 10),
                              ),
                              SizedBox(
                                height: 70,
                                child: FormFieldWidget(
                                  controllerEditting: controller.jobController,
                                  textInputType: TextInputType.text,
                                  setValueFunc: controller.setValuejob,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Ghi chú",
                                style: AppTextStyle.textTitleForm,
                              ),
                              SizedBox(
                                height: 70,
                                child: FormFieldWidget(
                                  controllerEditting:
                                      controller.descriptionController,
                                  textInputType: TextInputType.text,
                                  setValueFunc: controller.setValueDescription,
                                ),
                              ),
                              SizedBox(
                                height: UtilsReponsive.height(context, 10),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    width: context.width),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    minimumSize: const MaterialStatePropertyAll(
                                        Size(20, 50)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromARGB(255, 40, 127, 60)),
                                    // padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                                  ),
                                  child: Text(
                                    idWorkInDay != null
                                        ? "Cập nhật dữ liệu"
                                        : "Tạo công việc",
                                    style: TextStyleConstant.white16Roboto,
                                  ),
                                  onPressed: () async {
                                    await controller
                                        .createWorkInDay(idWorkInDay);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _viewChooseLandDivision(BuildContext context) {
    return GestureDetector(
      onTap: () {
        idWorkInDay != null
            ? null
            : showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                builder: (context) {
                  return SizedBox(
                    height: UtilsReponsive.height(context, 300),
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: UtilsReponsive.height(context, 10),
                        ),
                        Expanded(
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Column(
                                    children: [
                                      ListTile(
                                        trailing: controller
                                                    .listLand.value[index].id ==
                                                controller.landId.value
                                            ? const Icon(Icons.check)
                                            : null,
                                        onTap: () {
                                          controller.chooseLand(
                                              controller.listLand.value[index]);
                                          Get.back();
                                        },
                                        title: Text(controller
                                            .listLand.value[index].name!),
                                      ),
                                    ],
                                  ),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                    thickness: 1.0,
                                  ),
                              itemCount: controller.listLand.value.length),
                        ),
                      ],
                    ),
                  );
                },
              );
      },
      child: FormFieldWidget(
          isEnabled: false,
          suffixIcon: const Icon(Icons.arrow_drop_down),
          controllerEditting: controller.landIdController,
          setValueFunc: () {}),
    );
  }

  GestureDetector _viewChooseCropsfarm(BuildContext context) {
    return GestureDetector(
      onTap: () {
        idWorkInDay != null
            ? null
            : showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                builder: (context) {
                  return SizedBox(
                    height: UtilsReponsive.height(context, 300),
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: UtilsReponsive.height(context, 10),
                        ),
                        Expanded(
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Column(
                                    children: [
                                      ListTile(
                                        trailing: controller.listCropsFarm
                                                    .value[index].id ==
                                                controller.cropId.value
                                            ? const Icon(Icons.check)
                                            : null,
                                        onTap: () {
                                          controller.chooseCropsFarm(controller
                                              .listCropsFarm.value[index]);
                                          Get.back();
                                        },
                                        title: Text(controller
                                            .listCropsFarm.value[index].name!),
                                      ),
                                    ],
                                  ),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                    thickness: 1.0,
                                  ),
                              itemCount: controller.listCropsFarm.value.length),
                        ),
                      ],
                    ),
                  );
                },
              );
      },
      child: FormFieldWidget(
          isEnabled: false,
          suffixIcon: const Icon(Icons.arrow_drop_down),
          controllerEditting: controller.cropIdController,
          setValueFunc: () {}),
    );
  }
}
