import 'package:ContactsApp/src/widgets/contact_item.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final state;

  ContactList(this.state);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return ContactItem(state.contacts[index]);
        },
        itemCount: state.contacts.length);
  }
}
