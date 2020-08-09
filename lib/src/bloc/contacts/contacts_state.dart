import 'package:ContactsApp/src/models/contact.dart';
import 'package:equatable/equatable.dart';

class ContactsState extends Equatable {
  @override
  List<Contact> get props => throw UnimplementedError();
}

class InitialState extends ContactsState {
  @override
  String toString() => 'Initial State';
}

class ContactsLoading extends ContactsState {
  @override
  String toString() => 'ContactsLoading';
}

class ContactsLoaded extends ContactsState {
  final List<Contact> contacts;
  ContactsLoaded({this.contacts = const []});

  @override
  String toString() => 'ContactsLoaded';
}

class ContactsNotLoaded extends ContactsState {
  @override
  String toString() => 'ContactsNotLoaded';
}
