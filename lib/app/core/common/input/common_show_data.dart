import 'package:flutter/material.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';

class CommonShowData extends StatelessWidget {
  final String title;
  final String label;
  final Widget? widget;
  final IconData? iconData;

  const CommonShowData({
    Key? key,
    required this.title,
    this.widget,
    this.iconData,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (iconData != null)
                Icon(iconData!, color: Colors.grey, size: 30),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.textRowTitle,
                      softWrap: true, // Tự động xuống dòng
                    ),
                    Text(
                      label,
                      style: AppTextStyle.textRowLabel,
                      softWrap: true, // Tự động xuống dòng
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
