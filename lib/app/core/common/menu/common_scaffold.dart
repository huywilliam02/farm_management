import 'package:flutter/material.dart';
import 'package:itfsd/app/core/common/shimmer/shimmer.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/util/view_utils.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.drawer,
    this.backgroundColor = ColorConstant.background_color,
    this.hideKeyboardWhenTouchOutside = false,
    super.key,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final bool hideKeyboardWhenTouchOutside;

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      backgroundColor: backgroundColor,
      body: Shimmer(child: body),
      appBar: appBar,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
    );

    return hideKeyboardWhenTouchOutside
        ? GestureDetector(
            onTap: () => ViewUtils.hideKeyboard(context),
            child: scaffold,
          )
        : scaffold;
  }
}
