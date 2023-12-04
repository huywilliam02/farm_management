import 'package:itfsd/app/components/show_not_data.dart';
import 'package:itfsd/app/core/common/input/common_show_data.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/core/shared/format/date_time_format_constants.dart';
import 'package:itfsd/app/core/shared/role/role_constants.dart';
import 'package:itfsd/app/util/date_time_utils.dart';
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
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () {
                var selectedFarm = controller.selectedUser.value;
                return selectedFarm != null
                    ? Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  HttpNetWorkUrlApi.baseURL +
                                      selectedFarm.avatar,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonShowData(
                                  iconData: IconsUtils.username,
                                  title: "Họ và tên",
                                  label: selectedFarm.fullName,
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.job,
                                  title: "Chức danh",
                                  label: selectedFarm.jobTitle,
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.email,
                                  title: "Email",
                                  label: selectedFarm.email,
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.phone,
                                  title: "Số điện thoại",
                                  label: selectedFarm.phoneNumber,
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.datetime,
                                  title: "Ngày tham gia",
                                  label: selectedFarm.updatedAt != null
                                      ? DateTimeUtils.tryParse(
                                            date: selectedFarm.updatedAt
                                                .toString(),
                                            format: DateTimeFormatConstants
                                                .uiDateTime,
                                          )?.toStringWithFormat(
                                            DateTimeFormatConstants
                                                .uiDateDmy,
                                          ) ??
                                          'Invalid date'
                                      : 'No date available',
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.role,
                                  title: "Quyền hạn",
                                  label: controller.roleConstants
                                      .getRoleLabel(selectedFarm.role),
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.homeTown,
                                  title: "Quê quán",
                                  label: selectedFarm.homeTown,
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.homeTown,
                                  title: "Địa chỉ",
                                  label: selectedFarm.address,
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.description,
                                  title: "Thông tin chung",
                                  label: selectedFarm.description,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const ShowNotDataView();
              },
            ),
          ],
        ),
      ),
    );
  }
}
