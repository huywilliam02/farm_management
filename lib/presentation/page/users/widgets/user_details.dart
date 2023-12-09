import 'package:itfsd/app/core/common/dialog/dia_logs.dart';
import 'package:itfsd/presentation/page/users/user.dart';

class UserDetailsView extends BaseView<EditUserController> {
  const UserDetailsView({Key? key, this.idUser}) : super(key: key);
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
              var selectedUser = controller.selectedUser.value;
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
          if (controller.selectedUser.value != null) {
            return IconButton(
              onPressed: () {
                controller.showData(controller.selectedUser.value!);
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
  Widget _buildUserDetails(UserDetailsModel user) {
    return Column(
      children: [
        buildUserImage(user.avatar),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCommonShowData(
                  IconsUtils.username, "Họ và tên", user.fullName),
              buildCommonShowData(IconsUtils.job, "Chức danh", user.jobTitle),
              buildCommonShowData(IconsUtils.email, "Email", user.email),
              buildCommonShowData(
                  IconsUtils.phone, "Số điện thoại", user.phoneNumber),
              buildCommonShowData(
                IconsUtils.datetime,
                "Ngày tham gia",
                user.updatedAt != null
                    ? DateTimeUtils.tryParse(
                          date: user.updatedAt.toString(),
                          format: DateTimeFormatConstants.uiDateTime,
                        )?.toStringWithFormat(
                            DateTimeFormatConstants.uiDateDmy) ??
                        'Invalid date'
                    : 'No date available',
              ),
              buildCommonShowData(
                IconsUtils.role,
                "Quyền hạn",
                controller.roleConstants.getRoleLabel(user.role),
              ),
              buildCommonShowData(
                  IconsUtils.homeTown, "Quê quán", user.homeTown),
              buildCommonShowData(IconsUtils.homeTown, "Địa chỉ", user.address),
              buildCommonShowData(
                  IconsUtils.description, "Thông tin chung", user.description),
            ],
          ),
        ),
      ],
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
  Widget buildCommonShowData(IconData iconData, String title, String label) {
    return CommonShowData(
      iconData: iconData,
      title: title,
      label: label,
    );
  }

// event showdata
  void onEditButtonPressed() {
    Obx(() {
      if (controller.selectedUser.value != null) {
        return IconButton(
          onPressed: () {
            controller.showData(controller.selectedUser.value!);
          },
          icon: const Icon(IconsUtils.edit),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
