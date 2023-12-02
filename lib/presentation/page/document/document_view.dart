import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';

import 'package:itfsd/base/base_view.dart';

import '../../controllers/document/document_controller.dart';

class DocumentView extends BaseView<DocumentController> {
  const DocumentView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        centerTitle: true,
        titleType: AppBarTitle.text,
        title: "Tài liệu",
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: const Icon(Icons.arrow_back_ios_new),
        onLeadingPressed: () {
          Get.back();
        },
      ),
      body: const Center(
        child: Text(
          'Đang cập nhật',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
