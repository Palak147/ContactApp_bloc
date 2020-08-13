import 'package:ContactsApp/src/bloc/blocs.dart';
import 'package:ContactsApp/src/models/nav_item.dart';
import 'package:ContactsApp/src/screens/screens.dart';
import 'package:ContactsApp/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainContainerWidget extends StatefulWidget {
  @override
  _MainContainerWidgetState createState() => _MainContainerWidgetState();
}

class _MainContainerWidgetState extends State<MainContainerWidget> {
  @override
  void dispose() {
    super.dispose();
    //contactsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavDrawerBloc>(
      create: (context) => NavDrawerBloc(),
      child: BlocBuilder<NavDrawerBloc, NavDrawerState>(
        builder: (BuildContext context, NavDrawerState state) => Scaffold(
            drawer: NavDrawerWidget(),
            appBar: AppBar(
              title: Text(_setPageTitle(state.selectedItem)),
            ),
            body: _setPageContent(state),
            floatingActionButtonLocation:
                _setActionButtonsLocation(state.selectedItem),
            floatingActionButton: _setActionButtons(state)),
      ),
    );
    // return BlocProvider<NavDrawerBloc>(
    //   create: (BuildContext context) => NavDrawerBloc(),
    //   child: BlocBuilder<NavDrawerBloc, NavDrawerState>(
    //     builder: (BuildContext context, NavDrawerState state) => Scaffold(
    //         drawer: NavDrawerWidget(),
    //         appBar: AppBar(
    //           title: Text(_setPageTitle(state.selectedItem)),
    //         ),
    //         body: _setPageContent(state),
    //         floatingActionButtonLocation:
    //             _setActionButtonsLocation(state.selectedItem),
    //         floatingActionButton: _setActionButtons(state)),
    //   ),
    // );
  }

  String _setPageTitle(NavItem selectedItem) {
    if (selectedItem == NavItem.contactList)
      return 'Contacts';
    else
      return 'Favorite Contacts';
  }

  Widget _setPageContent(NavDrawerState state) {
    if (state.selectedItem == NavItem.contactList)
      // return MultiBlocProvider(
      //     providers: [
      //       BlocProvider<ContactsBloc>(
      //           create: (context) => ContactsBloc(),
      //           child: ContactListScreen()),
      //       BlocProvider<ContactsBloc>(
      //           create: (context) => ContactsBloc(),
      //           child: EditContactScreen()),
      //     ],
      //     child: MaterialApp(
      //       home: ContactListScreen(),
      //     ));
      // return BlocProvider<ContactsBloc>(
      //   create: (context) => ContactsBloc(),
      //   child: ContactListScreen(),
      // );
      //return ContactListScreen();
      // return MultiBlocProvider(
      //   providers: [
      //     BlocProvider<ContactsBloc>(
      //         create: (context) => ContactsBloc(), child: ContactListScreen()),
      //     BlocProvider<ContactsBloc>(
      //         create: (context) => ContactsBloc(), child: EditContactScreen()),
      //   ],
      //   child: MaterialApp(home: ContactListScreen()),
      // );

      return ContactListScreen();
    else {
      return FavoriteContactScreen();
    }
  }

  Widget _setActionButtons(NavDrawerState state) {
    if (state.selectedItem == NavItem.contactList) {
      // return BlocProvider<ContactsBloc>(
      //   create: (context) => ContactsBloc(),
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       contactsBloc.add(OpenAddContactUI(context));
      //     },
      //     child: Icon(Icons.add),
      //   ),
      // );
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, EditContactScreen.routeName);

          //Navigator.pushNamed(context, EditContactScreen.routeName);

          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => BlocProvider<ContactsBloc>(
          //               create: (context) => ContactsBloc(),
          //               child: EditContactScreen(),
          //             )));
        },
        child: Icon(Icons.add),
      );
    } else {
      return null;
    }
  }

  _setActionButtonsLocation(NavItem selectedItem) {
    if (selectedItem == NavItem.contactList) {
      return FloatingActionButtonLocation.endDocked;
    }
  }
}
