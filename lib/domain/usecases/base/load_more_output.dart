import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itfsd/app/core/constants/paging_constant.dart';
import 'package:itfsd/domain/usecases/base/base_output.dart';

part 'load_more_output.freezed.dart';

@freezed
class LoadMoreOutput<T> extends BaseOutput with _$LoadMoreOutput<T> {
  const LoadMoreOutput._();

  const factory LoadMoreOutput({
    required List<T> data,
    @Default(null) Object? otherData,
    @Default(PagingConstants.initialPage) int page,
    @Default(false) bool isRefreshSuccess,
    @Default(0) int offset,
    @Default(false) bool isLastPage,
  }) = _LoadMoreOutput;

  int get nextPage => page + 1;
  int get previousPage => page - 1;
}
