import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';

List<DrawerItem> drawerItems = [
  DrawerItem(name: 'Home', icon: AntIcons.home_outline, tag: '/home'),
  DrawerItem(
      name: 'Payment', icon: AntIcons.credit_card_outline, tag: '/payment'),
  DrawerItem(
      name: 'Favorite Stations',
      icon: AntIcons.like_outline,
      tag: '/favStations'),
  DrawerItem(
      name: 'Settings', icon: AntIcons.setting_outline, tag: '/settings'),
  DrawerItem(name: 'Sign Out', icon: Icons.exit_to_app, tag: '/signout')
];

class DrawerItem {
  String name;
  IconData icon;
  String tag;
  DrawerItem({this.name, this.icon, this.tag});
}
