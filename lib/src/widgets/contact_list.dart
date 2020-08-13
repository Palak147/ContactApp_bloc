import 'package:ContactsApp/src/bloc/blocs.dart';
import 'package:ContactsApp/src/widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactList extends StatelessWidget {
  final state;

  ContactList(this.state);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(state.contacts[index].id),
            child: ContactItem(state.contacts[index]),
            onDismissed: (direction) {
              //print(state.contacts[index].name);
              BlocProvider.of<ContactsBloc>(context)
                  .add(DeleteContact(state.contacts[index]));
            },
          );
        },
        itemCount: state.contacts != null ? state.contacts.length : null);
  }
}
