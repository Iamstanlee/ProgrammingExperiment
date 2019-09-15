import 'converter.dart';

// TODO: use streams for demo
// Stop @ meduim for initial release
void main() {
  var convert = new Converter();
  print(convert.convert(3100, Currency.usd));
}
