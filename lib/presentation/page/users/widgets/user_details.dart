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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/presentation/page/users/user.dart';

class UserDetailsView extends BaseView<EditUserController> {
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
        onLeadingPressed: () {
          // controller.refreshData();
          Get.back();
        },
        actions: [
          IconButton(
            onPressed: () {},
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
                var selectedUser = controller.selectedUser.value;
                return selectedUser != null
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
                                      selectedUser.avatar,
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
                                  label: selectedUser.fullName,
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.job,
                                  title: "Chức danh",
                                  label: selectedUser.jobTitle,
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.email,
                                  title: "Email",
                                  label: selectedUser.email,
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.phone,
                                  title: "Số điện thoại",
                                  label: selectedUser.phoneNumber,
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.datetime,
                                  title: "Ngày tham gia",
                                  label: selectedUser.updatedAt != null
                                      ? DateTimeUtils.tryParse(
                                            date: selectedUser.updatedAt
                                                .toString(),
                                            format: DateTimeFormatConstants
                                                .uiDateTime,
                                          )?.toStringWithFormat(
                                            DateTimeFormatConstants.uiDateDmy,
                                          ) ??
                                          'Invalid date'
                                      : 'No date available',
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.role,
                                  title: "Quyền hạn",
                                  label: controller.roleConstants
                                      .getRoleLabel(selectedUser.role),
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.homeTown,
                                  title: "Quê quán",
                                  label: selectedUser.homeTown,
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.homeTown,
                                  title: "Địa chỉ",
                                  label: selectedUser.address,
                                ),
                                CommonShowData(
                                  iconData: IconsUtils.description,
                                  title: "Thông tin chung",
                                  label: selectedUser.description,
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
