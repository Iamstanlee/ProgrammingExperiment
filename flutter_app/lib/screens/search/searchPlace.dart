import 'package:ant_icons/ant_icons.dart';
import 'package:evc/bloc/search_bloc.dart';
import 'package:evc/constants/styles.dart';
import 'package:evc/data/place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPlace extends StatefulWidget {
  static String tag = '/searchPlace';
  @override
  _SearchPlaceState createState() => _SearchPlaceState();
}

class _SearchPlaceState extends State<SearchPlace> {
  @override
  Widget build(BuildContext context) {
    var searchRouteState = Provider.of<SearchBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: (query) {
              searchRouteState.searchPlace(query, 'from');
            },
            style: textBoldBlack,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: searchRouteState.fromAddress == null
                    ? 'Search address...'
                    : searchRouteState.fromAddress.name,
                hintStyle: textBoldBlack),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.maybePop(context);
            },
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
          ),
          elevation: 2,
          backgroundColor: whiteColor,
        ),
        body: StreamBuilder(
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
                          searchRouteState.setAddress(places.elementAt(index));
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
            }));
  }
}
