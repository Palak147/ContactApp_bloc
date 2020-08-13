import 'package:ContactsApp/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FavoriteContactScreen extends StatelessWidget {
  static const routeName = 'FavoriteContactScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawerWidget(),
      body: Center(
        child: Text('Favorite Contact Screen'),
      ),
    );
  }
}
