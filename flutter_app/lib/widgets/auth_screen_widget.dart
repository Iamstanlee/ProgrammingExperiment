import 'dart:ui';
import 'package:flutter/material.dart';
import './loader_widget.dart' show Loader;

class AuthScreenBackdrop extends StatelessWidget {
  final GlobalKey scaffoldKey;
  final Widget child;
  final bool loading;
  AuthScreenBackdrop(
      {@required this.scaffoldKey,
      @required this.child,
      @required this.loading})
      : assert((child != null && loading != null && scaffoldKey != null));

  @override
  Widget build(BuildContext context) {
    var loaderContainer = (loading ? Loader() : Container());
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.darken),
                    image: ExactAssetImage('assets/images/bg.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(51, 60, 71, 0.8143),
                    Color.fromRGBO(255, 255, 255, 0)
                  ],
                  stops: [
                    0.3,
                    1.0
                  ]),
            ),
            child: child,
          ),
          loaderContainer
        ],
      ),
    );
  }
}
