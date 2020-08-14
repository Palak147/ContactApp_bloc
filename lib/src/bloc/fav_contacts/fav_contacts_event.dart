import 'package:equatable/equatable.dart';

abstract class FavContactsEvent extends Equatable {
  const FavContactsEvent();
}

class LoadFavContacts extends FavContactsEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoadFavContacts';
}
