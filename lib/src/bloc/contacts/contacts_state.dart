import 'package:ContactsApp/src/models/contact.dart';
import 'package:equatable/equatable.dart';

abstract class ContactsState extends Equatable {
  @override
  List<Object> get props => const [];

  const ContactsState();
}

class ContactsLoading extends ContactsState {
  ContactsLoading();
  @override
  String toString() => 'ContactsLoading';
}

class ContactsLoaded extends ContactsState {
  final List<Contact> contacts;
  const ContactsLoaded({this.contacts = const []});

  @override
  List<Object> get props => [contacts];

  @override
  String toString() => 'ContactsLoaded';
}

class ContactsNotLoaded extends ContactsState {
  @override
  String toString() => 'ContactsNotLoaded';
}

class AddingContactInProgress extends ContactsState {
  @override
  String toString() => 'AddingContactInProgress';
}

class AddingContactComplete extends ContactsState {
  @override
  String toString() => 'AddingContactComplete';
}
