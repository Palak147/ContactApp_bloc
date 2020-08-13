import 'package:ContactsApp/src/bloc/blocs.dart';
import 'package:ContactsApp/src/screens/screens.dart';
import 'package:ContactsApp/src/widgets/nav_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => MultiBlocProvider(
              child: HomeScreen(),
              providers: [
                BlocProvider<NavDrawerBloc>(
                  create: (context) => NavDrawerBloc(),
                  child: NavDrawerWidget(),
                ),
                BlocProvider<ContactsBloc>(
                  create: (context) => ContactsBloc(),
                  child: ContactListScreen(),
                ),
                BlocProvider<ContactsBloc>(
                  create: (context) => ContactsBloc(),
                  child: EditContactScreen(),
                ),
              ],
            ),
        EditContactScreen.routeName: (context) => BlocProvider<ContactsBloc>(
              create: (context) => ContactsBloc(),
              child: EditContactScreen(),
            )
      },
    );
  }
}
