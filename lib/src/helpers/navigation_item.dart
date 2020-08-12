import 'package:ContactsApp/src/models/nav_item.dart';
import 'package:flutter/material.dart';

class NavigationItem {
  final bool header;
  final NavItem item;
  final String title;
  final IconData icon;

  NavigationItem(this.header, this.item, this.title, this.icon);
}
