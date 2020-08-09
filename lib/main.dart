import 'package:ContactsApp/src/bloc/blocs.dart';
import 'package:ContactsApp/src/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(ContactApp());
}

class ContactApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.purple,
      ),
      home: BlocProvider(
        create: (context) => ContactsBloc(),
        child: ContactListScreen(),
      ),
      // routes: {
      //   '/': (ctx) => ContactListScreen(),
      //   EditContactScreen.routeName: (ctx) => EditContactScreen(),
      //   FavoriteContactScreen.routeName: (ctx) => FavoriteContactScreen(),
      // },
    );
  }
}
