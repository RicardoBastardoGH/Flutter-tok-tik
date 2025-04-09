

import 'package:intl/intl.dart';

class HumanFormats {

static String humanReadableNumber(int number) {
  final formattedNumber = NumberFormat.compactCurrency(
    decimalDigits: 0,
    symbol: '',
  ).format(number);
  return formattedNumber;
  // return formattedNumber.replaceAll(RegExp(r'[^0-9]'), '');
}

}