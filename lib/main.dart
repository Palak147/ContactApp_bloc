import 'package:ContactsApp/src/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      routes: {
        // EditContactScreen.routeName: (ctx) {
        //   return BlocProvider<ContactsBloc>(
        //     create: (context) => ContactsBloc(),
        //     child: EditContactScreen(),
        //   );
        // },

        //EditContactScreen.routeName: (ctx) => EditContactScreen(),
        // FavoriteContactScreen.routeName: (ctx) => FavoriteContactScreen(),
      },
      home: MainContainerWidget(),
    );
  }
}
