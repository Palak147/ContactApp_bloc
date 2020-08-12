import 'package:ContactsApp/src/models/contact.dart';
import 'package:equatable/equatable.dart';

abstract class ContactsState extends Equatable {
  @override
  List<Contact> get props => [];

  const ContactsState();
}

class ContactsLoading extends ContactsState {
  @override
  String toString() => 'ContactsLoading';
}

class ContactsLoaded extends ContactsState {
  final List<Contact> contacts;
  const ContactsLoaded([this.contacts = const []]);

  @override
  List<Contact> get props => contacts;

  @override
  String toString() => 'ContactsLoaded';
}

class ContactsNotLoaded extends ContactsState {
  @override
  String toString() => 'ContactsNotLoaded';
}
