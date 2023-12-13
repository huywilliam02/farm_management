import 'package:flutter_map/flutter_map.dart';
import 'package:itfsd/app/core/common/dialog/dia_logs.dart';
import 'package:itfsd/data/model/farming_calendar/schedule-detail.dart';
import 'package:itfsd/presentation/controllers/agricultural_products/agricultural_products_constant.dart';
import 'package:itfsd/presentation/controllers/farming_calendar/farming_calendar_controller.dart';
import 'package:itfsd/presentation/page/users/user.dart';
import 'package:latlong2/latlong.dart';

class FarmCalendarDetailsView extends BaseView<FarmingCalendarController> {
  const FarmCalendarDetailsView({Key? key, this.idUser}) : super(key: key);
  final String? idUser;

  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              var selectedUser = controller.selectedCalendar.value;
              return selectedUser != null
                  ? _buildUserDetails(selectedUser)
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
      title: "Chi tiết lịch canh tác",
      titleType: AppBarTitle.text,
      centerTitle: true,
      titleTextStyle: AppTextStyle.textTitleAppBar,
      leadingIcon: IconsUtils.back,
      onLeadingPressed: () {
        Get.back();
      },
      actions: [
        Obx(() {
          if (controller.selectedCalendar.value != null) {
            return IconButton(
              onPressed: () {
                controller.showData(controller.selectedCalendar.value!);
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
  Widget _buildUserDetails(DetailSchedule calendar) {
    return Column(
      children: [
        // buildUserImage(user.avatar),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tên sản phẩm: ${calendar.productName!}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Bắt đầu: " +
                    DateFormat("dd/MM/yyyy")
                        .format(DateTime.parse(calendar.startDay.toString())),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Người thực hiện: " +
                    DateFormat("dd/MM/yyyy")
                        .format(DateTime.parse(calendar.endDate.toString())),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Số lượng: ${calendar.numberOfVarites!.toString()}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Đơn vị cấp giống: ${calendar.seedProvider!}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sản lượng dự kiến: ${calendar.expectOutput!.toString() + calendar.unit!}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Vùng sản xuất: ${calendar.land!.name!}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => Container(
                  height: 200,
                  child: FlutterMap(
                    options: MapOptions(
                      center:
                          const LatLng(10.877541358205578, 106.8088219685599),
                      zoom: 12,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName:
                            'dev.fleaflet.flutter_map.example',
                      ),
                      PolygonLayer(
                        polygons: controller.listPolygon.value.toList(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Hình ảnh",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              _buildImageList(calendar.land!.images!),
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

  // build commonshowdata
  Widget buildCommonShowData(String title, String label) {
    return CommonShowData(
      title: title,
      label: label,
    );
  }

// event showdata
  void onEditButtonPressed() {
    Obx(() {
      if (controller.selectedCalendar.value != null) {
        return IconButton(
          onPressed: () {
            controller.showData(controller.selectedCalendar.value!);
          },
          icon: const Icon(IconsUtils.edit),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
