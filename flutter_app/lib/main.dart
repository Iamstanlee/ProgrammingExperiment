import 'package:evc/bloc/auth_bloc.dart';
import 'package:evc/bloc/filter_bloc.dart';
import 'package:evc/bloc/map_bloc.dart';
import 'package:evc/bloc/search_bloc.dart';
import 'package:evc/screens/auth/auth.dart';
import 'package:evc/screens/filter/filter.dart';
import 'package:evc/screens/home/home.dart';
import 'package:evc/screens/onboarding/onboarding.dart';
import 'package:evc/screens/search/search.dart';
import 'package:evc/screens/search/searchPlace.dart';
import 'package:evc/screens/search/searchRoute.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

MultiProvider provider;
AuthBloc appState = AuthBloc();

void main() {
  appState.init();
  provider = MultiProvider(
    child: Evc(),
    providers: [
      ChangeNotifierProvider(
        builder: (context) => appState,
      ),
      ChangeNotifierProvider(
        builder: (context) => MapBloc(),
      ),
      ChangeNotifierProvider(
        builder: (context) => FilterBloc(),
      ),
      ChangeNotifierProvider(
        builder: (context) => SearchBloc(),
      ),
    ],
  );
  runApp(provider);
}

class Evc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AuthBloc>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Evc',
        routes: {
          '/onboarding': (context) => Onboarding(),
          '/auth': (context) => Auth(),
          '/home': (context) => Home(),
          '/filter': (context) => Filter(),
          '/search': (context) => Search(),
          '/searchPlace': (context) => SearchPlace(),
          '/searchRoute': (context) => SearchRoute(),
          '/': (context) =>
              appState.currentUser == null ? Onboarding() : Home(),
        });
  }
}
