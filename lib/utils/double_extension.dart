import 'package:intl/intl.dart';

extension StringExtension on double {
  String formatAsCurrency({String locale = 'es_CO', String symbol = '\$'}) {
    NumberFormat currencyFormatter =
        NumberFormat.currency(locale: locale, symbol: symbol);

    return currencyFormatter.format(this);
  }

}
