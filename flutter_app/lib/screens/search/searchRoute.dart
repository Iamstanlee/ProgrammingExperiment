import 'dart:async';

import 'package:ant_icons/ant_icons.dart';
import 'package:evc/bloc/search_bloc.dart';
import 'package:evc/constants/styles.dart';
import 'package:evc/data/place.dart';
import 'package:evc/helpers/helper.dart';
import 'package:evc/screens/home/widgets/bottomsheet.dart';
import 'package:evc/screens/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchRoute extends StatefulWidget {
  static String tag = '/searchRoute';
  @override
  _SearchRouteState createState() => _SearchRouteState();
}

class _SearchRouteState extends State<SearchRoute> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  SearchBloc searchRouteState;

  @override
  void didChangeDependencies() {
    searchRouteState = Provider.of<SearchBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    searchRouteState.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Route', style: heading18Black),
        leading: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          color: Colors.black,
          icon: Icon(Icons.close),
        ),
        elevation: 2,
        backgroundColor: whiteColor,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: getHeight(context, height: 20),
            child: Card(
              child: BottomSheetWidget(
                fromController: fromController,
                toController: toController,
              ),
            ),
          ),
          StreamBuilder(
              stream: searchRouteState.places,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.length == 0) {
                    return Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: CupertinoActivityIndicator(
                          radius: 20.0,
                        ),
                      ),
                    );
                  }
                  List<Place> places = snapshot.data;
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            places.elementAt(index).name,
                            style: textBoldBlack,
                          ),
                          subtitle: Text(places.elementAt(index).address),
                          leading: Icon(AntIcons.search_outline),
                          onTap: () {
                            searchRouteState
                                .setAddress(places.elementAt(index));
                            if (searchRouteState.tag == 'from') {
                              fromController.clear();
                            } else {
                              toController.clear();
                            }
                            if (searchRouteState.fromAddress != null &&
                                searchRouteState.toAddress != null) {
                              Timer(Duration(seconds: 1), () {
                                navigate(context, Search.tag);
                              });
                            }
                          },
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                            height: 1,
                            color: Color(0xfff5f5f5),
                          ),
                      itemCount: places.length);
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
