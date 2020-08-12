import 'package:ContactsApp/src/bloc/blocs.dart';
import 'package:ContactsApp/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactListScreen extends StatefulWidget {
  static const routeName = 'ContactListScreen';
  ContactListScreen();
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  ContactsBloc contactsBloc;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    contactsBloc = BlocProvider.of<ContactsBloc>(context);
    contactsBloc.add(
      LoadContacts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        if (state is ContactsLoading) {
          return LoadingIndicator();
        } else if (state is ContactsLoaded) {
          if (state.contacts != null)
            return ListView.builder(
                itemBuilder: (context, index) {
                  return ContactItem(state.contacts[index]);
                },
                itemCount:
                    state.contacts != null ? state.contacts.length : null);
          else
            return Center(
              child: Text('No Contact'),
            );
        } else {
          return Center(child: Text("Contacts app home page"));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    //contactsBloc.close();
  }
}
