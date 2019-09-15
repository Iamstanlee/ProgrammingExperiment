import 'package:ant_icons/ant_icons.dart';
import 'package:evc/bloc/map_bloc.dart';
import 'package:evc/bloc/search_bloc.dart';
import 'package:evc/constants/styles.dart';
import 'package:evc/data/place.dart';
import 'package:evc/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  static String tag = '/search';
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Polyline> _polyline = {};
  Set<Marker> _marker = {};
  GoogleMapController controller;
  void _onMapCreated(GoogleMapController controllerParam) {
    var searchRouteState = Provider.of<SearchBloc>(context);
    var from = LatLng(
        searchRouteState.fromAddress.lat, searchRouteState.fromAddress.lng);
    var to =
        LatLng(searchRouteState.toAddress.lat, searchRouteState.toAddress.lng);
    // List<PointLatLng> result =
    // polylinePoints.decodePolyline("_p~iF~ps|U_ulLnnqC_mqNvxq`@");
    // print(result);
    setState(() {
      controller = controllerParam;
      _polyline.add(Polyline(
        polylineId: PolylineId('idRoute'),
        startCap: Cap.roundCap,
        endCap: Cap.squareCap,
        points: [from, to],
        visible: true,
        width: 4,
        color: Colors.blue,
      ));
      _marker.add(Marker(
          markerId: MarkerId('origin'),
          position: from,
          infoWindow: InfoWindow(title: searchRouteState.fromAddress.name),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)));
      _marker.add(Marker(
        markerId: MarkerId('destination'),
        infoWindow: InfoWindow(title: searchRouteState.toAddress.name),
        position: to,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    var searchRouteState = Provider.of<SearchBloc>(context);
    var initialPosition = LatLng(
        searchRouteState.fromAddress.lat, searchRouteState.fromAddress.lng);

    return Scaffold(
      key: scaffoldKey,
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
                        target: initialPosition,
                        zoom: 12,
                      ),
                      onMapCreated: _onMapCreated,
                      polylines: _polyline,
                      markers: _marker,
                    )),
                Flexible(
                    flex: 1,
                    child: Card(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(4),
                              child: Text('From'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: SizedBox(
                                width: getWidth(context),
                                child: Text(
                                  searchRouteState.fromAddress.name,
                                  style: textBoldBlack,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                              child: Text('To'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: SizedBox(
                                width: getWidth(context),
                                child: Text(
                                  searchRouteState.toAddress.name,
                                  style: textBoldBlack,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            Positioned(
              top: 10,
              left: 10,
              child: PreferredSize(
                preferredSize: Size(40, 40),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: blackColor.withOpacity(0.5),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                    icon: Icon(AntIcons.arrow_left),
                    color: whiteColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
