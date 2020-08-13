import 'package:ContactsApp/src/bloc/blocs.dart';
import 'package:ContactsApp/src/models/nav_item.dart';
import 'package:ContactsApp/src/screens/contact_list_screen.dart';
import 'package:ContactsApp/src/screens/favorite_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavDrawerBloc, NavDrawerState>(
      builder: (context, state) => state.selectedItem == NavItem.contactList
          ? ContactListScreen()
          : FavoriteContactScreen(),
    );
  }
}
