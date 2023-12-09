import 'package:itfsd/app/core/common/dialog/dia_logs.dart';
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

  // build appbar
  PreferredSizeWidget _buildAppBar() {
    return CommonAppBar(
      title: "Chi tiết thành viên",
      titleType: AppBarTitle.text,
      centerTitle: true,
      titleTextStyle: AppTextStyle.textTitleAppBar,
      leadingIcon: IconsUtils.back,
      onLeadingPressed: () {
        Get.back();
      },
      actions: [
        Obx(() {
          if (controller.selectedCrop.value != null) {
            return IconButton(
              onPressed: () {
                controller.showData(controller.selectedCrop.value!);
              },
              icon: const Icon(IconsUtils.edit),
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
      ],
    );
  }

  // build data
  Widget _buildCropDetails(CropsDetail crop) {
    return Column(
      children: [
        _buildImageList(crop.images!),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCommonShowData(IconsUtils.username, "Họ và tên", crop.name!),
            ],
          ),
        ),
      ],
    );
  }

  // build image get data
  Widget _buildImageList(List<String>? imageUrls) {
    if (imageUrls == null || imageUrls.isEmpty) {
      // Handle the case when 'imageUrls' is null or empty
      return Container(); // or any other fallback widget
    }

    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          var imageUrl = imageUrls[index];
          if (imageUrl != null) {
            return _buildCropImage(imageUrl);
          } else {
            // Handle the case when imageUrl is null
            return SizedBox.shrink(); // or any other fallback widget
          }
        },
      ),
    );
  }

  Widget _buildCropImage(String avatarUrl) {
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

  // build commonshowdata
  Widget buildCommonShowData(IconData iconData, String title, String label) {
    return CommonShowData(
      iconData: iconData,
      title: title,
      label: label,
    );
  }
}
