import 'package:flutter/material.dart';
import 'package:itfsd/app/core/common/shimmer/rounded_rectangle_shimmer.dart';
import 'package:itfsd/app/resources/dimens/app_dimen.dart';
import 'package:itfsd/app/resources/dimens/dimes.dart';

class LoadingItem extends StatelessWidget {
  const LoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return RounedRectangleShimmer(
      width: double.infinity,
      height: 60,
    );
  }
}
