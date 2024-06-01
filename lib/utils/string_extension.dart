import 'package:intl/intl.dart';

extension StringExtension on String {
  String formatAsCurrency({String locale = 'es_CO', String symbol = '\$'}) {
    int value = int.parse(this);
    NumberFormat currencyFormatter =
        NumberFormat.currency(locale: locale, symbol: symbol);

    return currencyFormatter.format(value);
  }

  String formatAsDate({String format = 'yyyy-MM-dd'}) {
    DateTime date = DateTime.parse(this);
    DateFormat formatter = DateFormat(format);
    return formatter.format(date);
  }

  formatDuration() {
    var duration = Duration(days: int.parse(this)).inDays;
    return  duration > 1 ? "$duration days" : "$duration day";
  }

   int toNumber(){
    return int.parse(this);
  }

  double toDouble(){
    return double.parse(this);
  }
}
