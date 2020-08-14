import 'dart:async';

import 'package:ContactsApp/src/bloc/fav_contacts/fav_contacts.dart';
import 'package:ContactsApp/src/repository/contact_db_repository.dart';
import 'package:bloc/bloc.dart';

class FavContactsBloc extends Bloc<FavContactsEvent, FavContactsState> {
  final ContactDbRepository contactsRepository = new ContactDbRepository();
  FavContactsBloc() : super(FavContactsNotLoaded());

  @override
  Stream<FavContactsState> mapEventToState(
    FavContactsEvent event,
  ) async* {
    if (event is LoadFavContacts) {
      yield* _mapLoadContactsToState();
    }
  }

  Stream<FavContactsState> _mapLoadContactsToState() async* {
    try {
      final favContacts = await this.contactsRepository.fetchFavContacts();
      yield FavContactsLoaded(favContacts: favContacts);
    } catch (_) {
      yield FavContactsNotLoaded();
    }
  }
}
