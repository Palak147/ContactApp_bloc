import 'package:ContactsApp/src/models/nav_item.dart';

class NavDrawerState {
  final NavItem selectedItem;
  const NavDrawerState(this.selectedItem);
}

class InitialNavState extends NavDrawerState {
  InitialNavState() : super(NavItem.contactList);

  @override
  String toString() => 'Initial State';
}
