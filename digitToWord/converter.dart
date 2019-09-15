import 'numbers.dart';

enum Currency { usd, ngn, yen, inr }

class Converter {
  /// handles special cases for unique numbers eg 10 - 19
  String specialCase(int figure) {
    return numbers[int.parse(figure.toString())];
  }

  String unit(int figure) {
    return numbers[figure];
  }

  String tens(int figure) {
    int firstDigit = int.parse(figure.toString()[0] + '0');
    if (figure > 9 && figure < 20) {
      return specialCase(figure);
    }

    return numbers[firstDigit] + " " + numbers[int.parse(figure.toString()[1])];
  }

  String hundred(int figure) {
    int firstDigit = int.parse(figure.toString()[0] + '00');
    if (figure > 99 && figure < 200) {
      return specialCase(figure);
    }
    return numbers[firstDigit] +
        " and " +
        tens(int.parse(figure.toString().substring(1)));
  }

  String thousand(int figure) {
    switch (figure.toString().length) {
      case 4:
        int firstDigit = int.parse(figure.toString()[0] + '000');
        return numbers[firstDigit] +
            ", " +
            hundred(int.parse(figure.toString().substring(1)));
        break;
      case 5:
        break;
      case 6:
        break;
      default:
        return '';
    }
    return '';
  }

  String million(int digits) {}

  String currencyToString(Currency currency) {
    switch (currency) {
      case Currency.usd:
        return ' US dollar';
        break;
      case Currency.ngn:
        return ' Naira';
        break;
      case Currency.inr:
        return ' Indian Rupees';
        break;
      default:
        return '';
    }
  }

  /// takes an [integer] as a parameter and returns the word representation of it
  /// ```
  ///  final converter = new Converter();
  ///  var amount = converter.convert(1200, Currency.usd); // One thousand two hundred US dollars
  /// ```
  String convert(int digits, Currency currency) {
    ///convert the digits to string to get the length
    String digitString = digits.toString();
    String currencyString = currencyToString(currency);
    switch (digitString.length) {
      case 0:
        return '';
        break;
      case 1:
        return unit(digits) + currencyString;
        break;
      case 2:
        return tens(digits) + currencyString;
        break;
      case 3:
        return hundred(digits) + currencyString;
        break;
      case 4:
        return thousand(digits) + currencyString;
        break;
      case 5:
        return thousand(digits) + currencyString;
        break;
      case 6:
        return thousand(digits) + currencyString;
        break;
      case 7:
        return million(digits) + currencyString;
        break;
      default:
        return '';
    }
  }
}
