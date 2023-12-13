import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';
import 'package:itfsd/app/util/number_format_utils.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:itfsd/presentation/controllers/agricultural_products/agricultural_products_constant.dart';
import 'package:itfsd/presentation/controllers/ingredients/ingredients_controller.dart';
import 'package:itfsd/presentation/page/edit_profile/edit_profile.dart';

class IngredientsDetailsView extends StatelessWidget {
  final String
      idIngredient; // Truyền vào ID của nguyên liệu cần hiển thị chi tiết

  const IngredientsDetailsView({Key? key, required this.idIngredient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IngredientsController controller = Get.find<IngredientsController>();

    // Gọi hàm để lấy chi tiết nguyên liệu từ ID
    // controller.getIngredientDetails(id);

    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Chi tiết nguyên liệu",
        titleType: AppBarTitle.text,
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () {
          Get.back();
        },
        actions: [
          Obx(() {
            if (controller.currentIngredient.value != null) {
              return IconButton(
                onPressed: () {
                  controller
                      .showDataIngredients(controller.currentIngredient.value!);
                },
                icon: const Icon(IconsUtils.edit),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            // Hiển thị thông tin chi tiết nguyên liệu
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageList(controller.currentIngredient.value!.images),
                  const SizedBox(height: 8.0),
                  Text(
                    'Tên nguyên liệu: ${controller.currentIngredient.value!.name!}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                      'Giá: ${NumberFormatUtils.formatDong(controller.currentIngredient.value!.money.toString())}'),
                  const SizedBox(height: 8.0),
                  Text(
                      'Số lượng: ${controller.currentIngredient.value!.quantity}'),
                  const SizedBox(height: 8.0),
                  Text(
                      'Khối lượng: ${controller.currentIngredient.value!.weight}'),
                  const SizedBox(height: 8.0),
                  Text(
                      'Thời gian: ${DateFormat("dd/MM/yyyy").format(DateTime.parse(controller.currentIngredient.value!.time.toString()))}'),
                  const SizedBox(height: 8.0),
                  Text(
                      'Thông tin: ${controller.currentIngredient.value!.information}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildImageList(List<String>? imageUrls) {
    if (imageUrls == null || imageUrls.isEmpty) {
      return Container(); // or any other fallback widget
    }

    return SizedBox(
      height: 300,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            SizedBox(width: UtilsReponsive.width(context, 10)),
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) =>
            _buildCropImage(imageUrls[index], context),
      ),
    );
  }

  Widget _buildCropImage(String imageUrl, BuildContext context) {
    return SizedBox(
      height: UtilsReponsive.height(context, 350),
      width: UtilsReponsive.width(context, 390),
      child: Center(
        child: CachedNetworkImage(
          imageUrl: "http://116.118.49.43:8878$imageUrl",
          errorWidget: (context, url, error) => const Icon(Icons.info),
          progressIndicatorBuilder: (context, url, progress) =>
              const CircularProgressIndicator(),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  // build image get data
  Widget buildUserImage(String avatarUrl) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(HttpNetWorkUrlApi.baseURL + avatarUrl),
        ),
      ),
    );
  }
}
