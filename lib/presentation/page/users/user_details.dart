import 'package:itfsd/app/components/show_not_data.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/core/constants/api_endpoint.dart';
import 'package:itfsd/presentation/controllers/farm/farm_controller.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/presentation/controllers/users/users_controller.dart';

class UserDetailsView extends BaseView<UsersController> {
  UserDetailsView({Key? key, this.idUser}) : super(key: key);
  String? idUser;
  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Chi tiết thành viên",
        titleType: AppBarTitle.text,
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () => Get.back(),
        actions: [
          IconButton(
            onPressed: () {
              controller.refreshForm();
              // Get.to(() => CreateUsersView(), transition: Transition.fadeIn);
            },
            icon: const Icon(IconsUtils.edit),
          )
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
                  var selectedFarm = controller.selectedUser.value;
                  return selectedFarm != null
                      ? Column(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            clipBehavior: Clip.antiAlias,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: Center(
                              child: Image.network(
                                HttpNetWorkUrlApi.baseURL +
                                    selectedFarm.avatar!,
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                selectedFarm.username,
                                style: AppTextStyle.textNameFarm,
                              ),
                            ],
                          ),
                        ],
                      )
                      : const ShowNotDataView();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
