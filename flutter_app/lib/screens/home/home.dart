import 'package:ant_icons/ant_icons.dart';
import 'package:evc/bloc/map_bloc.dart';
import 'package:evc/constants/styles.dart';
import 'package:evc/helpers/helper.dart';
import 'package:evc/screens/filter/filter.dart';
import 'package:evc/screens/search/searchPlace.dart';
import 'package:evc/screens/search/searchRoute.dart';
import 'package:evc/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'widgets/bottomsheet.dart';

class Home extends StatefulWidget {
  static String tag = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var mapState = Provider.of<MapBloc>(context);
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerWidget(
        activeScreenName: '/home',
      ),
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          'Evc',
          style: heading18Black,
        ),
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              navigate(context, SearchPlace.tag);
            },
            icon: Icon(AntIcons.search_outline),
          ),
          IconButton(
            onPressed: () {
              navigate(context, Filter.tag);
            },
            icon: Icon(AntIcons.filter_outline),
          )
        ],
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              children: <Widget>[
                Flexible(
                    flex: 4,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: mapState.myLocation,
                        zoom: 11,
                      ),
                      markers: ['My Location'].map((m) {
                        return Marker(
                            position: LatLng(28.6304, 77.2177),
                            markerId: MarkerId(m),
                            infoWindow: InfoWindow(
                                title: m, snippet: 'Location description'));
                      }).toSet(),
                    )),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigate(context, SearchRoute.tag);
        },
        tooltip: 'Search routes',
        child: Icon(AntIcons.compass_outline),
      ),
    );
  }
}
