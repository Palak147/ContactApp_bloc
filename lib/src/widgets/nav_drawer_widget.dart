import 'package:ContactsApp/src/bloc/blocs.dart';
import 'package:ContactsApp/src/helpers/navigation_item.dart';
import 'package:ContactsApp/src/models/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavDrawerWidget extends StatelessWidget {
  final List<NavigationItem> _listItems = [
    NavigationItem(false, NavItem.contactList, "Contacts", Icons.contacts),
    NavigationItem(
        false, NavItem.favoriteContactList, "Favorite Contacts", Icons.star),
  ];
  @override
  Widget build(BuildContext context) => Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: SafeArea(
        child: Container(
          color: Theme.of(context).accentColor,
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _listItems.length,
              itemBuilder: (BuildContext context, int index) =>
                  BlocBuilder<NavDrawerBloc, NavDrawerState>(
                    builder: (BuildContext context, NavDrawerState state) =>
                        _buildItem(context, _listItems[index], state),
                  )),
        ),
      ));

  Widget _buildItem(
          BuildContext context, NavigationItem data, NavDrawerState state) =>
      _makeListItem(data, state);

  Widget _makeListItem(NavigationItem data, NavDrawerState state) => Card(
        // color: data.item == state.selectedItem
        //     ? CoreColors.selectedNavItemRow
        //     : CoreColors.background,
        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.zero),
        borderOnForeground: true,
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Builder(
          builder: (BuildContext context) => ListTile(
            title: Text(
              data.title,
              style: TextStyle(
                color: data.item == state.selectedItem
                    ? Colors.blue
                    : Colors.blueGrey,
              ),
            ),
            leading: Icon(
              data.icon,
              // if it's selected change the color
              color: data.item == state.selectedItem
                  ? Colors.blue
                  : Colors.blueGrey,
            ),
            onTap: () => _handleItemClick(context, data.item),
          ),
        ),
      );
  void _handleItemClick(BuildContext context, NavItem item) {
    BlocProvider.of<NavDrawerBloc>(context).add(UpdateNavigation(item));
    Navigator.pop(context);
  }
}
