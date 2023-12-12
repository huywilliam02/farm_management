// guide_detail_page.dart

import 'package:flutter/material.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/presentation/controllers/agricultural_products/agricultural_products_constant.dart';
import 'agricultural_guide.dart';

class GuideDetailPage extends StatelessWidget {
  final AgriculturalGuide guide;

  const GuideDetailPage({Key? key, required this.guide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Chi tiết",
        titleTextStyle: AppTextStyle.textTitleAppBar,
        centerTitle: true,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () {
          Get.back();
        },
        titleType: AppBarTitle.text,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                guide.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                guide.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                " ${guide.author}",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 8),
              Text(
                "${guide.publishDate.toLocal()}",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 16),
              Text(
                guide.content,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
