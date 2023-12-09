import 'package:intl/intl.dart';
import 'package:itfsd/app/core/shared/format/number_format_constants.dart';
import 'package:itfsd/app/core/shared/symbol_constants.dart';

class NumberFormatUtils {
  NumberFormatUtils._();

  static String formatDong(String price) {
    // Chuyển đổi chuỗi thành số
    double priceDouble = double.tryParse(price) ?? 0.0;

    return NumberFormat.currency(
      decimalDigits: 0,
      symbol: SymbolConstants.dong,
      locale: "vi",
    ).format(priceDouble);
  }

  static String formatNumber(int number) {
    return NumberFormat(NumberFormatConstants.defaultFormat).format(number);
  }
}
