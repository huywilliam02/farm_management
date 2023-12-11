import 'package:itfsd/app/core/common/dialog/dia_logs.dart';
import 'package:itfsd/app/util/number_format_utils.dart';
import 'package:itfsd/data/model/crops/crops_detail.dart';
import 'package:itfsd/presentation/controllers/crops_farm/controllers/edit_crop_controller.dart';
import 'package:itfsd/presentation/page/users/user.dart';

class CropDetailsView extends BaseView<EditCropController> {
  const CropDetailsView({Key? key, this.cropId}) : super(key: key);
  final String? cropId;

  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              var crop = controller.selectedCrop.value;
              return crop != null
                  ? _buildCropDetails(crop)
                  : const ShowNotDataView();
            }),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CommonAppBar(
      title: "Chi tiết cây trồng",
      titleType: AppBarTitle.text,
      centerTitle: true,
      titleTextStyle: AppTextStyle.textTitleAppBar,
      leadingIcon: IconsUtils.back,
      onLeadingPressed: () {
        controller.refreshData();
        Get.back();
      },
      actions: [
        Obx(() {
          if (controller.selectedCrop.value != null) {
            return IconButton(
              onPressed: () =>
                  controller.showData(controller.selectedCrop.value!),
              icon: const Icon(IconsUtils.edit),
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
      ],
    );
  }

  Widget _buildCropDetails(CropsDetail crop) {
    return Column(
      children: [
        _buildImageList(crop.images!),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCommonShowData("Tên cây trồng", crop.name!),
              buildCommonShowData(
                "Giá tiền",
                NumberFormatUtils.formatDong(crop.price.toString()),
              ),
              buildCommonShowData("Thời gian thu hoạch", crop.harvest!),
              buildCommonShowData("Thuộc nhóm", crop.groupCrop!.name!),
              buildCommonShowData("Loại bệnh thường gặp", crop.disease!),
              buildCommonShowData("Đặc tính sinh trưởng", crop.growth!),
              buildCommonShowData("Đặc tính sử dụng", crop.use!),
            ],
          ),
        ),
      ],
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

  Widget buildCommonShowData(String title, String label) {
    return CommonShowData(
      title: title,
      label: label,
    );
  }
}
