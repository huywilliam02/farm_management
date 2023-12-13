import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/dialog/dia_logs.dart';
import 'package:itfsd/app/core/common/dialog/dialog_icon_button.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';

import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/presentation/controllers/farm/farm_controller.dart';
import 'package:latlong2/latlong.dart';

class FarmDetailsView extends BaseView<FarmController> {
  final String idFarm;

  FarmDetailsView({required this.idFarm});

  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Chi tiết nông trại",
        titleType: AppBarTitle.text,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: const Icon(
          Icons.arrow_back_ios_new,
        ),
        onLeadingPressed: () {
          Get.back();
        },
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Dialogs.materialDialog(
                  msg:
                      'Chỉ có chủ hội và thư ký hoặc người có quyền mới sử dụng được tính năng này.',
                  title: "Bạn không có quyền truy cập",
                  color: Colors.white,
                  context: context,
                  actions: [
                    DiaLogIconsButton(
                      onPressed: () {
                        Get.back();
                      },
                      text: 'Trở lại',
                      iconData: Icons.cancel_outlined,
                      color: Colors.white,
                      textStyle: TextStyle(color: Colors.grey),
                      iconColor: Colors.grey,
                    ),
                  ]);
            },
            icon: Icon(IconsUtils.edit),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 9,
              child: Obx(
                () {
                  var selectedFarm = controller.selectedFarm.value;

                  return selectedFarm != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.network(
                                  HttpNetWorkUrlApi.baseURL +
                                      selectedFarm.image!,
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Tên: ${selectedFarm.name}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, // Màu chữ
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Mô hình kinh doanh: ${selectedFarm.businessModel}',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Loại hình doanh nghiệp: ${selectedFarm.businessType}',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Tỉnh: ${selectedFarm.province}'),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Huyện: ${selectedFarm.district}'),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Xã: ${selectedFarm.wards}'),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Địa chỉ: ${selectedFarm.address}'),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Vị trí:',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 200,
                                child: FlutterMap(
                                  options: MapOptions(
                                    center: LatLng(
                                      selectedFarm.location.latitude,
                                      selectedFarm.location.longitude,
                                    ),
                                    zoom: 14.0,
                                  ),
                                  children: [
                                    TileLayer(
                                      urlTemplate:
                                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                      userAgentPackageName:
                                          'dev.fleaflet.flutter_map.example',
                                    ),
                                    MarkerLayer(markers: [
                                      Marker(
                                        point: LatLng(
                                          selectedFarm.location.latitude,
                                          selectedFarm.location.longitude,
                                        ),
                                        builder: (context) => GestureDetector(
                                          onTap: () {
                                            // openMap(
                                            //   widget.landArea.locations.first.latitude,
                                            //   widget.landArea.locations.first.longitude,
                                            // );
                                          },
                                          child: Container(
                                            child: Icon(
                                              Icons.location_on,
                                              size: 40.0,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      )
                                    ])
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : const Text('Không có dữ liệu');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
