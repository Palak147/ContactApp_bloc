import 'package:ContactsApp/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EditContactScreen extends StatelessWidget {
  static const routeName = 'EditContactScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: 'Add Contact',
      ),
      body: SafeArea(
        child: Center(
          child: Text('Edit Contact Screen'),
        ),
      ),
    );
  }
}
