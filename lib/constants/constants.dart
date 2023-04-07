

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {

}

class NavItem {
  String? item;

  NavItem({this.item});

  static List<NavItem> navItemList = [
    NavItem(item: "Home"),
    NavItem(item: "Explore"),
    NavItem(item: "Blog"),
    NavItem(item: "FAQ"),
    NavItem(item: "Account"),
  ];

}

class DrawerItem {
  String? item;
  IconData? data;

  DrawerItem({this.item, this.data});

  static List<DrawerItem> drawerItemList = [
    DrawerItem(item: "Dashboard", data: Icons.dashboard_outlined),
    DrawerItem(item: "Profile", data: Icons.person_outline_outlined),
    DrawerItem(item: "My Listings", data: Icons.list_alt_outlined),
    DrawerItem(item: "Favorites", data: Icons.favorite_border_outlined),
    DrawerItem(item: "Plugins", data: Icons.hub_outlined),
  ];
}