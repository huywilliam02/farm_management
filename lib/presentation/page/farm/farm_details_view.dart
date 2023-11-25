import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';
import 'package:itfsd/presentation/controllers/farm/farm_controller.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FarmDetailsView extends BaseView<FarmController> {
  FarmDetailsView({Key? key, this.idFarm}) : super(key: key);
  String? idFarm;
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () async {
                      Get.toNamed(Routes.MAIN_TABVIEW);
                    },
                  ),
                  const Expanded(
                    flex: 6,
                    child: Center(
                      child: Text(
                        'Chi tiết nông trại',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 18),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox())
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: Obx(
                () {
                  var selectedFarm = controller.selectedFarm.value;
                  return selectedFarm != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
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
                              Row(
                                children: [
                                  Text(
                                    '${selectedFarm.name}',
                                    style: AppTextStyle.textNameFarm,
                                  ),
                                ],
                              ),
                              Text(
                                'Địa chỉ: ${selectedFarm.address}',
                                style: AppTextStyle.textAddressFarm,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${selectedFarm.businessModel}',
                                    style: AppTextStyle.textBusinessFarm,
                                  ),
                                  Text(
                                    '${selectedFarm.businessType}',
                                    style: AppTextStyle.textBusinessFarm,
                                  ),
                                ],
                              ),
                              Text('${selectedFarm.district}'),
                              Text('${selectedFarm.province}'),
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
