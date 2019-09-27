import 'numbers.dart';

enum Currency { usd, ngn, yen, inr }

class Converter {
  /// handles special cases for unique numbers eg 10 - 19
  String specialCase(String figure) {
    return numbers[int.parse(figure.toString())];
  }

  String unit(String figure) {
    return numbers[figure];
  }

  String tens(String figure) {
    int firstDigit = toInt(figure[0] + '0');
    if (toInt(figure) > 9 && toInt(figure) < 20) {
      return specialCase(figure);
    }
    return numbers[firstDigit] + " " + numbers[toInt(figure[1])];
  }

  String hundred(String figure) {
    int firstDigit = toInt(figure[0] + '00');
    if (toInt(figure) > 99 && toInt(figure) < 200) {
      return specialCase(figure);
    }
    return numbers[firstDigit] + " and " + tens(figure.substring(1));
  }

// 200000
  String thousand(String figure) {
    // var thousandFigure =
    switch (figure.toString().length) {
      case 4:
        int firstDigit = toInt(figure[0] + '000');
        return numbers[firstDigit] + ", " + this.hundred(figure.substring(1));
        break;
      case 5:
        int firstDigit = toInt(figure[0] + figure[1] + '000');
        return numbers[firstDigit] + ", " + this.hundred(figure.substring(2));
        break;
      case 6:
        break;
      default:
        return '';
    }
    return '';
  }

  String million(String figure) {}

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
        return ' ';
    }
  }

  /// takes an [integer] as a parameter and returns the word representation of it
  /// ```
  ///  final converter = new Converter();
  ///  var amount = converter.convert(1200, Currency.usd); // One thousand two hundred US dollars
  /// ```
  String convert(int digits, Currency currency) {
    //convert the digits to string to get the length
    String digitString = digits.toString();
    String currencyString = currencyToString(currency);
    switch (digitString.length) {
      case 0:
        throw new Exception('Digits length cannot be empty');
        break;
      case 1:
        return unit(digitString) + currencyString;
        break;
      case 2:
        return tens(digitString) + currencyString;
        break;
      case 3:
        return hundred(digitString) + currencyString;
        break;
      case 4:
        return thousand(digitString) + currencyString;
        break;
      case 5:
        return thousand(digitString) + currencyString;
        break;
      case 6:
        return thousand(digitString) + currencyString;
        break;
      case 7:
        return million(digitString) + currencyString;
        break;
      default:
        return '';
    }
  }
}

/// returns the integer representation of a string
int toInt(String value) {
  return int.parse(value);
}
