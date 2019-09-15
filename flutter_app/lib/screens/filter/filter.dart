import 'package:ant_icons/ant_icons.dart';
import 'package:evc/constants/styles.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  static String tag = '/filter';
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter',
          style: heading18Black,
        ),
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Distance',
                style: textBoldBlack,
              ),
            ),
            Column(
              children: [
                Distance(distance: '5km'),
                Distance(distance: '10km'),
                Distance(distance: '15km')
              ].map<Widget>((i) {
                return ListTile(
                  title: Text(
                    i.distance,
                  ),
                  leading: Icon(AntIcons.environment_outline),
                  trailing: Switch(
                    onChanged: (value) {
                      setState(() {
                        i.selected = value;
                      });
                    },
                    value: i.selected,
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Connectors',
                style: textBoldBlack,
              ),
            ),
            Column(
              children: [
                Connector(type: 'Type A'),
                Connector(type: 'Type B'),
                Connector(type: 'Type C')
              ].map<Widget>((i) {
                return ListTile(
                  title: Text(
                    '${i.type} connector',
                  ),
                  leading: Icon(AntIcons.api_outline),
                  trailing: Switch(
                    onChanged: (value) {
                      setState(() {
                        i.selected = value;
                      });
                    },
                    value: i.selected,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Distance {
  String distance;
  bool selected;
  Distance({this.distance, this.selected = false});
}

class Connector {
  String type;
  bool selected;
  Connector({this.type, this.selected = false});
}
