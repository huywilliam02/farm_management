import 'package:intl/intl.dart';
import 'package:itfsd/app/core/shared/format/number_format_constants.dart';
import 'package:itfsd/app/core/shared/symbol_constants.dart';

class NumberFormatUtils {
  NumberFormatUtils._();

  static String formatDong(double price) {
    return NumberFormat.currency(
      decimalDigits: 0,
      symbol: SymbolConstants.dong,
      locale: "vi",
    ).format(price);
  }

  static String formatNumber(int number) {
    return NumberFormat(NumberFormatConstants.defaultFormat).format(number);
  }
}
