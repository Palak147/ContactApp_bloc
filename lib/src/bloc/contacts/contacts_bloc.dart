import 'package:ContactsApp/src/bloc/blocs.dart';
import 'package:ContactsApp/src/repository/contact_db_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './contacts_event.dart';
import './contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactDbRepository contactsRepository = new ContactDbRepository();
  ContactsBloc() : super(ContactsLoading());

  @override
  Stream<ContactsState> mapEventToState(event) async* {
    if (event is LoadContacts) {
      yield* _mapLoadContactsToState();
    } else if (event is AddContact) {
      yield* _mapAddContactToState(event);
    } else if (event is UpdateContact) {
      yield* _mapUpdateTodoToState(event);
    } else if (event is DeleteContact) {
      yield* _mapDeleteTodoToState(event);
    }
  }

  Stream<ContactsState> _mapLoadContactsToState() async* {
    try {
      final contacts = await this.contactsRepository.fetchContacts();
      yield ContactsLoaded(contacts: contacts);
    } catch (_) {
      yield ContactsNotLoaded();
    }
  }

  Stream<ContactsState> _mapAddContactToState(AddContact event) async* {
    yield AddingContactInProgress();
    await this.contactsRepository.addContact(event.contact);
    yield AddingContactComplete();
  }

  Stream<ContactsState> _mapUpdateTodoToState(UpdateContact event) async* {
    yield AddingContactInProgress();
    await this.contactsRepository.updateContact(event.updatedContact);
    yield AddingContactComplete();
  }

  Stream<ContactsState> _mapDeleteTodoToState(DeleteContact event) async* {
    if (state is ContactsLoaded) {
      final updatedContacts = (state as ContactsLoaded)
          .contacts
          .where((contact) => contact.id != event.contact.id)
          .toList();
      yield ContactsLoaded(contacts: updatedContacts);
      this.contactsRepository.deleteContactById(event.contact.id);
    }
  }
}
