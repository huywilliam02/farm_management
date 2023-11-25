import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:itfsd/app/core/common/page_view/controller/common_paging_controller.dart';
import 'package:itfsd/app/core/common/page_view/error_view/common_first_page_error_indicator.dart';
import 'package:itfsd/app/core/common/page_view/error_view/common_new_page_error_indicator.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_first_page_progress_indicator.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_new_page_progress_indicator.dart';
import 'package:itfsd/app/core/common/page_view/no_items_found_view/common_no_items_found_indicator.dart';
import 'package:itfsd/app/core/common/page_view/no_more_items_view/common_no_more_items_indicator.dart';
import 'package:itfsd/app/core/constants/duration_constants.dart';

class CommonPagedSliverGrid<T> extends StatelessWidget {
  const CommonPagedSliverGrid({
    required this.pagingController,
    required this.itemBuilder,
    required this.gridDelegate,
    this.animateTransitions = true,
    this.transitionDuration = DurationConstants.defaultListGridTransitionDuration,
    this.firstPageErrorIndicator,
    this.newPageErrorIndicator,
    this.firstPageProgressIndicator,
    this.newPageProgressIndicator,
    this.noItemsFoundIndicator,
    this.noMoreItemsIndicator,
    super.key,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.showNewPageProgressIndicatorAsGridChild = false,
    this.showNewPageErrorIndicatorAsGridChild = false,
    this.showNoMoreItemsIndicatorAsGridChild = false,
    this.shrinkWrapFirstPageIndicators = false,
  });

  final CommonPagingController<T> pagingController;
  final Widget Function(
    BuildContext context,
    T item,
    int index,
  ) itemBuilder;
  final bool animateTransitions;
  final Duration transitionDuration;
  final Widget? firstPageErrorIndicator;
  final Widget? newPageErrorIndicator;
  final Widget? firstPageProgressIndicator;
  final Widget? newPageProgressIndicator;
  final Widget? noItemsFoundIndicator;
  final Widget? noMoreItemsIndicator;

  final SliverGridDelegate gridDelegate;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final bool showNewPageProgressIndicatorAsGridChild;
  final bool showNewPageErrorIndicatorAsGridChild;
  final bool showNoMoreItemsIndicatorAsGridChild;
  final bool shrinkWrapFirstPageIndicators;

  @override
  Widget build(BuildContext context) {
    final builderDelegate = PagedChildBuilderDelegate<T>(
      itemBuilder: itemBuilder,
      animateTransitions: animateTransitions,
      transitionDuration: transitionDuration,
      firstPageErrorIndicatorBuilder: (_) =>
          firstPageErrorIndicator ?? const CommonFirstPageErrorIndicator(),
      newPageErrorIndicatorBuilder: (_) =>
          newPageErrorIndicator ?? const CommonNewPageErrorIndicator(),
      firstPageProgressIndicatorBuilder: (_) =>
          firstPageProgressIndicator ?? const CommonFirstPageProgressIndicator(),
      newPageProgressIndicatorBuilder: (_) =>
          newPageProgressIndicator ?? const CommonNewPageProgressIndicator(),
      noItemsFoundIndicatorBuilder: (_) =>
          noItemsFoundIndicator ?? const CommonNoItemsFoundIndicator(),
      noMoreItemsIndicatorBuilder: (_) =>
          noMoreItemsIndicator ?? const CommonNoMoreItemsIndicator(),
    );

    final pagedView = PagedSliverGrid(
      pagingController: pagingController.pagingController,
      builderDelegate: builderDelegate,
      gridDelegate: gridDelegate,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      showNewPageProgressIndicatorAsGridChild: showNewPageProgressIndicatorAsGridChild,
      showNewPageErrorIndicatorAsGridChild: showNewPageErrorIndicatorAsGridChild,
      showNoMoreItemsIndicatorAsGridChild: showNoMoreItemsIndicatorAsGridChild,
      shrinkWrapFirstPageIndicators: shrinkWrapFirstPageIndicators,
    );

    return pagedView;
  }
}