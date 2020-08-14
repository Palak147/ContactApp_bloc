import 'dart:io';

import 'package:ContactsApp/src/bloc/blocs.dart';
import 'package:ContactsApp/src/helpers/unique_color_generator.dart';
import 'package:ContactsApp/src/screens/edit_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactItem extends StatelessWidget {
  final contact;

  ContactItem(this.contact);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      leading: CircleAvatar(
        backgroundImage:
            contact.imageUrl != '' ? FileImage(File(contact.imageUrl)) : null,
        backgroundColor:
            contact.imageUrl == '' ? UniqueColorGenerator.getColor() : null,
        child: contact.imageUrl == '' ? Text(contact.name[0]) : null,
      ),
      title: Text(contact.name),
      onTap: () {
        Navigator.of(context)
            .pushNamed(EditContactScreen.routeName, arguments: contact)
            .then((value) =>
                BlocProvider.of<ContactsBloc>(context).add(LoadContacts()));
      },
    );
  }
}
