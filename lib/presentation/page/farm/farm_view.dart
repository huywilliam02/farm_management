import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/common_app_bar.dart';
import 'package:itfsd/app/core/common/common_scaffold.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';
import 'package:itfsd/presentation/controllers/farm/farm_controller.dart';


class FarmView extends BaseView<FarmController> {
  const FarmView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        title: "Danh sách nông trại",
        titleType: AppBarTitle.text,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        onLeadingPressed: () {},
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onChanged: (value) async {},
              decoration: InputDecoration(
                hintText: "Tìm kiếm",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            SizedBox(
              height: UtilsReponsive.height(context, 10),
            ),
            Expanded(
              flex: 9,
              child: Obx(
                () => controller.isLoading.value && controller.listFarm.isEmpty
                    ? const CommonLoadingPageProgressIndicator()
                    : const ListViewLoader(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewLoader extends BaseView<FarmController> {
  const ListViewLoader({super.key});
  @override
  Widget buildView(BuildContext context) {
    return ListView.separated(
        itemCount: controller.listFarm.length,
        separatorBuilder: (context, index) => const Divider(
              color: Colors.grey,
              indent: 1,
              height: 4,
            ),
        itemBuilder: (context, index) {
          var product = controller.listFarm[index];
          return InkWell(
            onTap: () {
              controller.showFarmDetails(product);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.network(
                    HttpNetWorkUrlApi.baseURL +
                        controller.listFarm[index].image!,
                    height: 90,
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.listFarm[index].name!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/icons/next.png",
                    height: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          );
        });
  }
}
