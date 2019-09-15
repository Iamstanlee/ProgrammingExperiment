import 'package:ant_icons/ant_icons.dart';
import 'package:evc/bloc/search_bloc.dart';
import 'package:evc/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetWidget extends StatefulWidget {
  final TextEditingController fromController;
  final TextEditingController toController;
  BottomSheetWidget({this.fromController, this.toController});
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    var searchRouteState = Provider.of<SearchBloc>(context);

    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.zero,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    AntIcons.compass_outline,
                    size: 20.0,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.more_vert,
                    size: 20.0,
                    color: Colors.black45,
                  ),
                  Icon(
                    AntIcons.environment_outline,
                    size: 20.0,
                    color: redColor,
                  )
                ],
              ),
            ),
            Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width - 50,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextField(
                            onChanged: (query) {
                              searchRouteState.searchPlace(query, 'from');
                            },
                            controller: widget.fromController,
                            style: textBoldBlack,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: searchRouteState.fromAddress == null
                                    ? 'From...'
                                    : searchRouteState.fromAddress.name,
                                hintStyle: textBoldBlack),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 50.0,
                      height: 1.0,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width - 50.0,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextField(
                            onChanged: (query) {
                              searchRouteState.searchPlace(query, 'to');
                            },
                            controller: widget.toController,
                            style: textBoldBlack,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: searchRouteState.toAddress == null
                                    ? 'To...'
                                    : searchRouteState.toAddress.name,
                                hintStyle: textBoldBlack),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Expanded(flex: 1, child: Text(''))
          ],
        ));
  }
}
