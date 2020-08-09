import 'package:ContactsApp/src/models/contact.dart';
import 'package:equatable/equatable.dart';

abstract class ContactsEvent extends Equatable {
  const ContactsEvent();
}

class LoadContacts extends ContactsEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoadContacts';
}

class AddContact extends ContactsEvent {
  final Contact contact;

  AddContact(this.contact);
  @override
  String toString() => 'AddContact';

  @override
  List<Object> get props => [];
}

class UpdateContact extends ContactsEvent {
  @override
  String toString() => 'UpdateContact';

  @override
  List<Object> get props => [];
}

class DeleteContact extends ContactsEvent {
  @override
  String toString() => 'DeleteContact';

  @override
  List<Object> get props => [];
}
