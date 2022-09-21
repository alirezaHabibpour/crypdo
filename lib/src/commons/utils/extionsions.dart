import 'package:intl/intl.dart' as intl;


extension intUtils on int {
  String get toPriceFormat {
    var formatObj = intl.NumberFormat('#,###');
    String correctPrice = formatObj.format(this ~/ 10).toString();
    return correctPrice;
  }
}

