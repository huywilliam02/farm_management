import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/dialog/dia_logs.dart';
import 'package:itfsd/app/core/common/dialog/dialog_icon_button.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/app/util/number_format_utils.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';

import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/presentation/controllers/farm/farm_controller.dart';
import 'package:itfsd/presentation/controllers/material/material_controller.dart';
import 'package:latlong2/latlong.dart';

class MaterialDetailsView extends BaseView<MaterialController> {
  final String idMaterial;

  MaterialDetailsView({required this.idMaterial});

  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Chi tiết vật tư",
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
          Obx(() {
            if (controller.selectedMaterial.value != null) {
              return IconButton(
                onPressed: () {
                  controller.showData(controller.selectedMaterial.value!);
                },
                icon: const Icon(IconsUtils.edit),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
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
                  var selectedFarm = controller.selectedMaterial.value;
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
                                      selectedFarm!.images.first,
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
                                'Số lượng: ${selectedFarm.quantity}',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'Giá: ${NumberFormatUtils.formatDong(selectedFarm.price.toString())}'),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Ghi chú: ${selectedFarm.description}'),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Nhóm: ${selectedFarm.materialGroup.name}'),
                              SizedBox(
                                height: 10,
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
