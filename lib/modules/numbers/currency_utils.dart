import 'package:intl/intl.dart';

String formatCurrency(
  double value, {
  required String locale,
  required String symbol,
}) {
  final formatter = NumberFormat.currency(locale: locale, symbol: symbol);
  return formatter.format(value);
}
