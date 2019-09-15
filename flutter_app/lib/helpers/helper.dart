import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:evc/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

String getID({length: 28}) {
  const chars =
      "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
  String result = "";
  for (var i = 0; i < length; i++) {
    result += chars[rnd.nextInt(chars.length)];
  }
  return result;
}

/// return a random integer from range 0 to [max] params
int getRandomInt(int max) {
  return new Random().nextInt(max);
}

/// returns the path to the cache temp directory
Future<String> getDir() async {
  // Directory tempDir = await getTemporaryDirectory();
  Directory tempDir = await getApplicationDocumentsDirectory();
  return tempDir.path;
}

/// takes a percentage of the screens width and return a double of current width
double getWidth(context, {width}) {
  if (width == null) return MediaQuery.of(context).size.width;
  return ((width / 100) * MediaQuery.of(context).size.width);
}

/// takes a percentage of the screens height and return a double of screen height.
double getHeight(context, {height}) {
  if (height == null) return MediaQuery.of(context).size.height;
  return ((height / 100) * MediaQuery.of(context).size.height);
}

/// Navigate to a new route by passing a route widget with a fade animation
/// default animation duration is a second
void navigateWithTransition(
  context,
  to,
) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) {
        return to;
      },
      transitionsBuilder: (context, animation1, animation2, child) {
        return FadeTransition(
          opacity: animation1,
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 1000),
    ),
  );
}

/// Navigate to a new route by passing a route widget tag
void navigate(context, to) {
  Navigator.pushNamed(context, to);
}

/// Navigate to a new route by passing a route widget tag
///  and dispose the previous routes
void navigateToDispose(context, to) {
  Navigator.pushNamedAndRemoveUntil(context, to, (_) => false);
}

/// Show snack bar from anywhere in the by passing a global key of type scffold state and the string to be displayed
showSnackBar(GlobalKey<ScaffoldState> _scaffoldState, String content) {
  if (content == null) return;
  if (_scaffoldState.currentState == null) return;
  _scaffoldState.currentState.showSnackBar(SnackBar(
    content: Text(content, style: textBoldWhite),
  ));
}

/// Pop up a dialog box with a button that carry a callback function ,
/// Also you can set the dialog theme color (optional),button icon(optional),title and desc
/// Default Theme color is Red
void showDialogBox(
    {@required context,
    @required title,
    @required desc,
    color: Colors.blue,
    icon: Icons.info_outline,
    buttonText: "Close",
    Function callBack}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: new Card(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          color: color,
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(child: new Text(desc)),
                      SizedBox(
                        height: 10,
                      ),
                      new Center(
                        child: RaisedButton.icon(
                            shape: StadiumBorder(),
                            textColor: Colors.white,
                            color: color,
                            onPressed: () {
                              try {
                                callBack();
                              } catch (err) {}
                              Navigator.of(context).pop();
                            },
                            icon: Icon(icon),
                            label: Text(buttonText)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      });
}

/// Takes a Widget, optional opacity and optional image String and
/// Returns a new widget with an image as its background set to the passed in opacity
/// Default [Opacity: 0.5]
dynamic customBackground({@required child, opacity: 0.5, String image}) {
  return new Container(
    decoration: new BoxDecoration(
      image: new DecorationImage(
        image: ExactAssetImage(image),
        fit: BoxFit.cover,
      ),
    ),
    child: new BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: new Container(
        child: child,
        decoration: new BoxDecoration(color: Colors.white.withOpacity(opacity)),
      ),
    ),
  );
}
