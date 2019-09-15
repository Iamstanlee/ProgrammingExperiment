import 'package:cached_network_image/cached_network_image.dart';
import 'package:evc/bloc/auth_bloc.dart';
import 'package:evc/constants/styles.dart';
import 'package:evc/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'drawerItems.dart';

class DrawerWidget extends StatefulWidget {
  final String activeScreenName;
  DrawerWidget({this.activeScreenName});

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AuthBloc>(context);
    return Container(
        width: getWidth(context, width: 80),
        color: Colors.white,
        child: Column(children: <Widget>[
          UserAccountsDrawerHeader(
            margin: EdgeInsets.all(0.0),
            accountName: new Text(
              appState.currentUser.name,
              style: headingWhite,
            ),
            accountEmail: new Text(
              appState.currentUser.email,
              style: headingWhite,
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new ClipRRect(
                  borderRadius: new BorderRadius.circular(100.0),
                  child: GestureDetector(
                      onTap: () {},
                      child: new Container(
                        height: 80.0,
                        width: 80.0,
                        color: primaryColor,
                        child: CachedNetworkImage(
                          imageUrl: appState.currentUser.profilePhoto,
                          fit: BoxFit.cover,
                          placeholder: (context, uri) {
                            return Container(
                                height: 80.0, width: 80.0, color: primaryColor);
                          },
                        ),
                      ))),
            ),
            onDetailsPressed: () {},
          ),
          MediaQuery.removePadding(
              context: context,
              // DrawerHeader consumes top MediaQuery padding.
              removeTop: true,
              child: new Expanded(
                  child: new ListView(
                      children: drawerItems.map((item) {
                return new Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: new Container(
                        height: 60.0,
                        color: widget.activeScreenName.compareTo(item.tag) == 0
                            ? greyColor
                            : whiteColor,
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              flex: 1,
                              child: Icon(
                                item.icon,
                                color: blackColor,
                              ),
                            ),
                            new Expanded(
                              flex: 3,
                              child: new Text(
                                item.name,
                                style: headingBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }).toList())))
        ]));
  }
}
