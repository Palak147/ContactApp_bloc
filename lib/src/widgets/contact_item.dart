import 'package:ContactsApp/src/helpers/UniqueColorGenerator.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final contact;

  ContactItem(this.contact);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      leading: CircleAvatar(
        backgroundColor: UniqueColorGenerator.getColor(),
        child: Text(contact.name[0]),
      ),
      title: Text(contact.name),
      onTap: () {},
    );
  }
}
