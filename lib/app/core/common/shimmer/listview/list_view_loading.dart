import 'package:flutter/material.dart';
import 'package:itfsd/app/core/common/shimmer/shimmer_loading.dart';
import 'package:itfsd/app/core/constants/ui_constants.dart';

import 'loading_item.dart';

/// Because [PagedListView] does not expose the [itemCount] property, itemCount = 0 on the first load and thus the Shimmer loading effect can not work. We need to create a fake ListView for the first load.
class ListViewLoader extends StatelessWidget {
  const ListViewLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: UiConstants.shimmerItemCount,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: const ShimmerLoading(
          loadingWidget: LoadingItem(),
          isLoading: true,
          child: LoadingItem(),
        ),
      ),
    );
  }
}