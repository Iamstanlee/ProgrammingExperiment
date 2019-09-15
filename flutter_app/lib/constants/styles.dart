import 'package:flutter/material.dart';
import 'fonts.dart';

/// return an error text style
get errorTextStyle => TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    );

///default button style
get buttonStyle => TextStyle(
    fontFamily: baseFont, color: Colors.white, fontWeight: FontWeight.w600);

/// default scaffold color
get scaffoldColor => Color(0xff1A0D17);

get appbarTitleStyle =>
    TextStyle(fontFamily: baseFont, fontSize: 16, fontWeight: FontWeight.w900);

/// return a button text style
get proceedFormButtonTextStyle => TextStyle(fontSize: 18.0);

/// return a form field text style
get registerFormTextStyle => TextStyle(color: Colors.white, fontSize: 18.0);

/// return a form field text style
get loginFormTextStyle => TextStyle(
      color: Colors.white,
      fontSize: 18.0,
    );

// theme

TextStyle textStyle = TextStyle(
  color: Color(0XFF000000),
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  fontFamily: textFont,
);

TextStyle textStyleWhite = TextStyle(
  color: Color(0XFFFFFFFF),
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  fontFamily: textFont,
);

TextStyle textBoldBlack = TextStyle(
  color: Color(0XFF000000),
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  fontFamily: textFont,
);

TextStyle textBoldWhite = TextStyle(
  color: Color(0XFFFFFFFF),
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
  fontFamily: textFont,
);

TextStyle textBlackItalic = TextStyle(
  color: Color(0XFF000000),
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.italic,
  fontFamily: textFont,
);

TextStyle textGrey = TextStyle(
  color: Colors.grey,
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  fontFamily: textFont,
);

TextStyle textGreyBold = TextStyle(
  color: Colors.grey,
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  fontFamily: textFont,
);

TextStyle textStyleBlue = TextStyle(
  color: primaryColor,
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  fontFamily: textFont,
);

TextStyle textStyleActive = TextStyle(
  color: Color(0xFFF44336),
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  fontFamily: textFont,
);

TextStyle textStyleValidate = TextStyle(
  color: Color(0xFFF44336),
  fontSize: 11.0,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.italic,
  fontFamily: textFont,
);

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    title: base.title.copyWith(
      fontFamily: baseFont,
    ),
  );
}

TextStyle textGreen = TextStyle(
  color: Color(0xFF00c497),
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  fontFamily: textFont,
);

final ThemeData base = ThemeData.light();

ThemeData appTheme = new ThemeData(
  primaryColor: primaryColor,
  buttonColor: primaryColor,
  indicatorColor: Colors.white,
  splashColor: Colors.white24,
  splashFactory: InkRipple.splashFactory,
  accentColor: Color(0xFF13B9FD),
  canvasColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.white,
  errorColor: Color(0xFFB00020),
  highlightColor: activeColor,
  iconTheme: new IconThemeData(color: primaryColor),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: _buildTextTheme(base.textTheme),
  primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  accentTextTheme: _buildTextTheme(base.accentTextTheme),
);

Color textFieldColor = Color.fromRGBO(168, 160, 149, 0.6);
Color whiteColor = Color(0XFFFFFFFF);
Color blackColor = Color(0XFF242A37);
Color greyColor = Color(0XFFF1F2F6);
Color greyColor2 = Colors.grey;
Color activeColor = Color(0xFFF44336);
Color redColor = Color(0xFFFF0000);
Color buttonStop = Color(0xFFF44336);
Color primaryColor = Color(0xFFFFD428);
Color secondary = Color(0xFFFF8900);
Color facebook = Color(0xFF4267b2);
Color googlePlus = Color(0xFFdb4437);
Color yellow = Colors.pinkAccent;
Color green1 = Colors.lightGreen;
Color green2 = Colors.green;
Color blue1 = Colors.lightBlue;
Color blue2 = Colors.blue;
Color tim = Colors.deepPurple;
Color tim2 = Colors.deepPurpleAccent;

Color greenColor = Color(0xFF00c497);
// Color greyColor = Colors.grey;

TextStyle textStyleSmall = TextStyle(
    color: Color.fromRGBO(255, 255, 255, 0.8),
    fontSize: 12.0,
    fontFamily: "Roboto",
    fontWeight: FontWeight.bold);

//Image miniLogo = new Image(
//    image: new ExactAssetImage("assets/header-logo.png"),
//    height: 28.0,
//    width: 20.0,
//    alignment: FractionalOffset.center);

TextStyle headingWhite = new TextStyle(
  color: Colors.white,
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  fontFamily: textFont,
);

TextStyle headingWhite18 = new TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  fontWeight: FontWeight.normal,
  fontFamily: textFont,
);

TextStyle headingRed = new TextStyle(
  color: redColor,
  fontSize: 22.0,
  fontWeight: FontWeight.normal,
  fontFamily: textFont,
);

TextStyle headingGrey = new TextStyle(
  color: Colors.grey,
  fontSize: 22.0,
  fontWeight: FontWeight.normal,
  fontFamily: textFont,
);

TextStyle heading18 = new TextStyle(
  color: Colors.white,
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  fontFamily: textFont,
);

TextStyle heading18Black = new TextStyle(
  color: blackColor,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  fontFamily: textFont,
);

TextStyle headingBlack = new TextStyle(
  color: blackColor,
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  fontFamily: textFont,
);

TextStyle headingPrimaryColor = new TextStyle(
  color: primaryColor,
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  fontFamily: textFont,
);

TextStyle headingLogo = new TextStyle(
  color: blackColor,
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  fontFamily: textFont,
);

TextStyle heading35 = new TextStyle(
  color: Colors.white,
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
  fontFamily: textFont,
);

TextStyle heading35Black = new TextStyle(
  color: blackColor,
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
  fontFamily: textFont,
);

Color transparentColor = Color.fromRGBO(0, 0, 0, 0.2);
Color activeButtonColor = Color.fromRGBO(43, 194, 137, 50.0);
Color dangerButtonColor = Color(0XFFf53a4d);

int getColorHexFromStr(String colorStr) {
  colorStr = "FF" + colorStr;
  colorStr = colorStr.replaceAll("#", "");
  int val = 0;
  int len = colorStr.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = colorStr.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw new FormatException("An error occurred when converting a color");
    }
  }
  return val;
}
