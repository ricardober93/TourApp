import 'package:intl/intl.dart';

extension StringExtension on String {
  String formatAsCurrency({String locale = 'es_CO', String symbol = '\$'}) {
    double value = double.tryParse(this) ?? 0.0;
    NumberFormat currencyFormatter =
        NumberFormat.currency(locale: locale, symbol: symbol);

    return currencyFormatter.format(value);
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
