import 'converter.dart';

// TODO: use streams for demo
// Stop @ medium for initial release
void main() {
  var convert = new Converter();
  print(convert.convert(900, Currency.usd));
}
