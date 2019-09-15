import 'package:flutter/material.dart';
import 'package:evc/constants/fonts.dart';
import 'package:evc/constants/styles.dart';
import 'package:evc/helpers/helper.dart';
import 'package:evc/screens/auth/auth.dart';
import 'widgets/data.dart';

class Onboarding extends StatefulWidget {
  static String tag = '/onboarding';

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ItemsListBuilder itemsListBuilder = new ItemsListBuilder();
    TabController controller = DefaultTabController.of(context);
    return (new Scaffold(
      body: new DefaultTabController(
          length: itemsListBuilder.itemList.length,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                  child: new TabBarView(
                      children: itemsListBuilder.itemList.map((Items item) {
                return new Column(
                  key: new ObjectKey(item),
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      item.image,
                      height: 180.0,
                    ),
                    new Text(
                      item.pageNo,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: baseFont,
                          fontSize: 24,
                          fontWeight: FontWeight.w900),
                    ),
                    new Container(
                      padding: new EdgeInsets.only(left: 60.0, right: 60.0),
                      child: new Text(
                        item.description,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontFamily: textFont),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    item.index == 2
                        ? ButtonTheme(
                            minWidth: getWidth(context, width: 10),
                            height: 40.0,
                            child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(0.0)),
                              elevation: 0.0,
                              color: primaryColor,
                              child: new Text(
                                item.btnDescription,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: textFont,
                                    fontWeight: FontWeight.w900),
                              ),
                              onPressed: () {
                                navigateToDispose(context, Auth.tag);
                              },
                            ),
                          )
                        : Container()
                  ],
                );
              }).toList())),
              new Container(
                margin: new EdgeInsets.only(bottom: 32.0),
                child: new TabPageSelector(
                  indicatorSize: 6,
                  controller: controller,
                  selectedColor: Colors.black,
                ),
              )
            ],
          )),
    ));
  }
}
