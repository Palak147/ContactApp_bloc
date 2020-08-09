import 'package:ContactsApp/src/bloc/blocs.dart';
import 'package:ContactsApp/src/screens/screens.dart';
import 'package:ContactsApp/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ContactsBloc>(context).add(LoadContacts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Contact List',
        appBar: AppBar(),
        widgets: <Widget>[],
      ),
      body: BlocBuilder<ContactsBloc, ContactsState>(
        builder: (context, state) {
          if (state is InitialState) {
            return CircularProgressIndicator();
          } else if (state is ContactsLoaded) {
            return ContactList(state);
          }
          return Center(child: Text("Contacts app home page"));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        child: FloatingActionButton(
          onPressed: () => Navigator.of(context)
              .pushReplacementNamed(EditContactScreen.routeName),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
