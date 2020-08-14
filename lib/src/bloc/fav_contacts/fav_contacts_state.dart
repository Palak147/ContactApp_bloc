import 'package:ContactsApp/src/models/contact.dart';
import 'package:equatable/equatable.dart';

abstract class FavContactsState extends Equatable {
  @override
  List<Object> get props => const [];

  const FavContactsState();
}

class FavContactsLoading extends FavContactsState {
  FavContactsLoading();
  @override
  String toString() => 'FavContactsLoading';
}

class FavContactsLoaded extends FavContactsState {
  final List<Contact> favContacts;
  const FavContactsLoaded({this.favContacts = const []});

  @override
  List<Object> get props => [favContacts];

  @override
  String toString() => 'FavContactsLoaded';
}

class FavContactsNotLoaded extends FavContactsState {
  @override
  String toString() => 'ContactsNotLoaded';
}
