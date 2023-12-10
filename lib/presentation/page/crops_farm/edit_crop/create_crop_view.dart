import 'package:get/get.dart';
import 'package:itfsd/app/core/common/menu/common_constrain_box_button.dart';
import 'package:itfsd/presentation/page/crops_farm/crop.dart';

class CreateCropView extends BaseView<CropsFarmController> {
  const CreateCropView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCreateEditItem(
                title: "Tên cây trồng",
                widget: buildCommonFormFieldWidget(
                  controller: controller.nameController,
                  textInputType: TextInputType.text,
                  setValueFunc: controller.setValueName,
                ),
              ),
              buildCreateEditItem(
                title: "Loại bệnh thường gặp",
                widget: buildCommonFormFieldWidget(
                  controller: controller.diseaseController,
                  textInputType: TextInputType.text,
                  setValueFunc: controller.setValueDisease,
                ),
              ),
              buildCreateEditItem(
                title: "Đặc tính sinh trưởng",
                widget: buildCommonFormFieldWidget(
                  textInputType: TextInputType.text,
                  controller: controller.growthController,
                  setValueFunc: controller.setValueGrowth,
                ),
              ),
              buildCreateEditItem(
                title: "Đặc tính sử dụng cây trồng",
                widget: buildCommonFormFieldWidget(
                  controller: controller.userController,
                  textInputType: TextInputType.text,
                  setValueFunc: controller.setValueUser,
                ),
              ),
              buildCreateEditItem(
                title: "Thu hoạch",
                widget: buildCommonFormFieldWidget(
                  textInputType: TextInputType.text,
                  controller: controller.harvestController,
                  setValueFunc: controller.setValueHarvest,
                ),
              ),
              buildCreateEditItem(
                title: "Giá bán giống cây trồng",
                widget: buildCommonFormFieldWidget(
                  textInputType: TextInputType.number,
                  controller: controller.priceController,
                  setValueFunc: (value) {
                    controller.price.value = int.tryParse(value) ?? 0;
                  },
                ),
              ),
              buildCreateEditItem(
                title: "Nhóm cây trồng",
                widget: Obx(() {
                  controller.groupCrop.value;
                  return viewChooseProduct(context);
                }),
              ),
              buildCreateEditItem(
                  title: "Chọn ảnh cây trồng",
                  widget: buildImageStack(context)),
              SizedBox(
                height: UtilsReponsive.height(context, 20),
              ),
              _buildConstrainBoxButton("Thêm cây trồng"),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return CommonAppBar(
      title: "Thêm cây trồng",
      centerTitle: true,
      titleType: AppBarTitle.text,
      titleTextStyle: AppTextStyle.textTitleAppBar,
      leadingIcon: IconsUtils.back,
      onLeadingPressed: () {
        controller.refreshForm();
        controller.refreshData();
        Get.back();
      },
    );
  }

  CommonCreateEditItem buildCreateEditItem(
      {required String title, required Widget widget}) {
    return CommonCreateEditItem(
      title: title,
      widget: widget,
    );
  }

  CommonFormFieldWidget buildCommonFormFieldWidget({
    required TextEditingController controller,
    required TextInputType textInputType,
    required Function(String) setValueFunc,
  }) {
    return CommonFormFieldWidget(
      controllerEditting: controller,
      textInputType: textInputType,
      setValueFunc: setValueFunc,
    );
  }

  GestureDetector viewChooseProduct(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
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
                  SizedBox(height: UtilsReponsive.height(context, 10)),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                        trailing: controller.listgroupCrop.value[index].id! ==
                                controller.groupCrop.value
                            ? const Icon(Icons.check)
                            : null,
                        onTap: () {
                          controller.chooseGroupCrop(
                              controller.listgroupCrop.value[index]);
                          Get.back();
                        },
                        title:
                            Text(controller.listgroupCrop.value[index].name!),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: controller.listgroupCrop.value.length,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: CommonFormFieldWidget(
        isEnabled: false,
        suffixIcon: const Icon(Icons.arrow_drop_down),
        controllerEditting: controller.groupCropController,
        setValueFunc: () {},
      ),
    );
  }

  Widget _buildConstrainBoxButton(String text) {
    return CommonConstrainBoxButton(
      text: text,
      onPressed: () {
        controller.createCropsfarm();
      },
    );
  }

  Stack buildImageStack(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: UtilsReponsive.height(context, 160),
          width: double.infinity,
          child: Obx(() => ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                scrollDirection: Axis.horizontal,
                itemCount: controller.listImage.isNotEmpty
                    ? controller.listImage.length + 1
                    : 1,
                itemBuilder: (context, index) {
                  if (controller.listImage.isNotEmpty) {
                    if (index == controller.listImage.length) {
                      return SizedBox(
                        height: UtilsReponsive.height(context, 150),
                        width: UtilsReponsive.width(context, 150),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              controller.onImagePick();
                            },
                            icon: Image.asset(
                              "assets/icons/gallery.png",
                              height: 90,
                              width: 50,
                            ),
                          ),
                        ),
                      );
                    }
                    return buildImageStackItem(context, index);
                  } else {
                    return SizedBox(
                      height: UtilsReponsive.height(context, 150),
                      width: UtilsReponsive.width(context, 150),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            controller.onImagePick();
                          },
                          icon: Image.asset(
                            "assets/icons/gallery.png",
                            height: UtilsReponsive.height(context, 90),
                            width: UtilsReponsive.width(context, 50),
                          ),
                        ),
                      ),
                    );
                  }
                },
              )),
        ),
      ],
    );
  }

  GestureDetector buildImageStackItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.LIBRARY_IMAGE, arguments: controller.listImage);
      },
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.file(
            File(controller.listImage[index]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
