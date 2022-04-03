double deci(double number, int decimals) {
  String numberTrimmed = number.toStringAsFixed(decimals);
  return double.parse(numberTrimmed);
}
