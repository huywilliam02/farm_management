import 'package:flutter/material.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';

class CommonCreateEditItem extends StatelessWidget {
  final Widget widget;
  final String title;
  const CommonCreateEditItem({
    super.key,
    required this.widget,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        children: [
          Row(
            children: [
              Text(title, style: AppTextStyle.textTitleForm),
            ],
          ),
          const SizedBox(height: 10),
          widget
        ],
      ),
    );
  }
}
