import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/app/core/common/common_app_bar.dart';
import 'package:itfsd/app/core/common/common_constrain_box_button.dart';
import 'package:itfsd/app/core/common/common_scaffold.dart';
import 'package:itfsd/app/core/common/form_field_widget.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/app/resource/theme/app_text_style.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:flutter/material.dart';

import 'package:itfsd/app/core/constants/app_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:itfsd/app/core/common/common_create_edit_item.dart';
import 'package:itfsd/presentation/controllers/account/controllers/account_controller.dart';
import 'package:itfsd/presentation/controllers/login/login_controller.dart';
import '../../controllers/edit_profile/edit_profile_controller.dart';

class EditProfileView extends BaseView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        title: "Tài khoản",
        titleType: AppBarTitle.text,
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: IconUtils.back,
        onLeadingPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: Stack(
                  // fit: StackFit.expand,
                  children: [
                    // GetBuilder<AccountController>(
                    //   builder: (controller) => controller.loginModel.value.images == ""
                    //       ?
                    ClipOval(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: 150,
                        height: 450,
                        imageUrl:
                            "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=2000",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    )
                    // : Container(
                    //     clipBehavior: Clip.hardEdge,
                    //     height: 150,
                    //     width: 150,
                    //     decoration: BoxDecoration(shape: BoxShape.circle),
                    //     child: CachedNetworkImage(
                    //       fit: BoxFit.fill,
                    //       imageUrl:
                    //           "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=2000",
                    //       progressIndicatorBuilder:
                    //           (context, url, downloadProgress) =>
                    //               CircularProgressIndicator(
                    //                   value: downloadProgress.progress),
                    //       errorWidget: (context, url, error) =>
                    //           const Icon(Icons.error),
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //     bottom: -5,
                    //     right: -5,
                    //     child: IconButton(
                    //         onPressed: () async {},
                    //         icon: const Icon(Icons.add_a_photo)))
                  ],
                ),
              ),
            ),
            CommonCreateEditItem(
              title: "Họ và tên",
              widget: FormFieldWidget(setValueFunc: () {}),
            ),
            SizedBox(
              height: 10,
            ),
            CommonCreateEditItem(
              title: "Số điện thoại",
              widget: FormFieldWidget(setValueFunc: () {}),
            ),
            SizedBox(
              height: 10,
            ),
            CommonCreateEditItem(
              title: "Email",
              widget: FormFieldWidget(setValueFunc: () {}),
            ),
            SizedBox(
              height: 10,
            ),
            CommonCreateEditItem(
              title: "Loại thành viên",
              widget: FormFieldWidget(setValueFunc: () {}),
            ),
            SizedBox(
              height: 10,
            ),
            CommonCreateEditItem(
              title: "Số điện thoại",
              widget: FormFieldWidget(setValueFunc: () {}),
            ),
            SizedBox(
              height: 10,
            ),
            CommonCreateEditItem(
              title: "Chức danh",
              widget: FormFieldWidget(setValueFunc: () {}),
            ),
            SizedBox(
              height: 10,
            ),
            CommonCreateEditItem(
              title: "Nhóm quyền",
              widget: FormFieldWidget(setValueFunc: () {}),
            ),
            SizedBox(
              height: 10,
            ),
            CommonCreateEditItem(
              title: "Quê quán",
              widget: FormFieldWidget(setValueFunc: () {}),
            ),
            SizedBox(
              height: 10,
            ),
            CommonCreateEditItem(
              title: "Thông tin chung",
              widget: SizedBox(
                height: 100,
                child: FormFieldWidget(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  setValueFunc: () {},
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: CommonConstrainBoxButton(
                text: "Cập nhật",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
