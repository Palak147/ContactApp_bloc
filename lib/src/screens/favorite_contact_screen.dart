import 'package:ContactsApp/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FavoriteContactScreen extends StatelessWidget {
  static const routeName = 'FavoriteContactScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: 'Favorite Contacts',
      ),
      body: SafeArea(
        child: Center(
          child: Text('Favorite Contact Screen'),
        ),
      ),
    );
  }
}
