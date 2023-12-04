import 'package:flutter/material.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';

class CommonShowData extends StatelessWidget {
  final String title;
  final String label;
  final Widget? widget;
  final IconData? iconData; // Thêm dòng này để chứa IconData

  const CommonShowData({
    Key? key, // Sửa dòng này để chứa key
    required this.title,
    this.widget,
    this.iconData, // Thêm dòng này
    required this.label,
  }) : super(key: key); // Sửa dòng này

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (iconData != null) // Hiển thị biểu tượng nếu có
                Icon(iconData,
                    color: Colors.grey,
                    size: 30), // Thay đổi màu và kích thước theo ý muốn
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyle.textRowTitle),
                  Text(label, style: AppTextStyle.textRowLabel),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
