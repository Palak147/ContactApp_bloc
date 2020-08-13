import 'package:ContactsApp/src/bloc/blocs.dart';
import 'package:ContactsApp/src/screens/edit_contact_screen.dart';
import 'package:ContactsApp/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactListScreen extends StatefulWidget {
  static const routeName = 'ContactListScreen';

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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      drawer: NavDrawerWidget(),
      body: BlocBuilder<ContactsBloc, ContactsState>(
        builder: (context, state) {
          if (state is ContactsLoading) {
            return LoadingIndicator();
          } else if (state is ContactsLoaded) {
            return state.contacts != null
                ? ContactList(state)
                : Text('Welcome to contact app');
          } else {
            return Text('Welcome to contact app');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(EditContactScreen.routeName).then(
                (value) =>
                    BlocProvider.of<ContactsBloc>(context).add(LoadContacts()));
          }),
    );
  }
}
