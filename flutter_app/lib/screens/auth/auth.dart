import 'package:evc/bloc/auth_bloc.dart';
import 'package:evc/constants/fonts.dart';
import 'package:evc/constants/styles.dart';
import 'package:evc/helpers/helper.dart';
import 'package:evc/screens/home/home.dart';
import 'package:evc/widgets/auth_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Auth extends StatefulWidget {
  static String tag = '/auth';
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthBloc>(context);

    return AuthScreenBackdrop(
        scaffoldKey: scaffoldKey,
        loading: isLoading,
        child: Center(child: _signInButton(() {
          setState(() {
            isLoading = true;
          });
          auth.signIn(onDone: () {
            setState(() {
              isLoading = false;
            });
            navigateToDispose(context, Home.tag);
          }, onError: () {
            setState(() {
              isLoading = false;
            });
            showSnackBar(scaffoldKey, 'Error Signing User');
          });
        })));
  }
}

Widget _signInButton(signIn) {
  return RaisedButton(
    color: googlePlus,
    onPressed: signIn,
    elevation: 10.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
              image: AssetImage("assets/icons/google_logo.png"), height: 25.0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Sign in with Google',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: textFont,
                  fontWeight: FontWeight.w900),
            ),
          )
        ],
      ),
    ),
  );
}
