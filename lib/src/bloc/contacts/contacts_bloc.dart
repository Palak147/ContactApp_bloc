import 'package:ContactsApp/src/models/contact.dart';
import 'package:ContactsApp/src/repository/contact_db_repository.dart';
import 'package:bloc/bloc.dart';
import './contacts_event.dart';
import './contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactDbRepository contactsRepository = new ContactDbRepository();

  ContactsBloc() : super(InitialState());

  @override
  Stream<ContactsState> mapEventToState(event) async* {
    if (event is LoadContacts) {
      yield* _mapLoadContactsToState();
    } else if (event is AddContact) {
      yield* _mapAddContactToState(event);
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
    if (state is ContactsLoaded) {
      final List<Contact> updatedContacts =
          List.from((state as ContactsLoaded).contacts)..add(event.contact);
      yield ContactsLoaded(contacts: updatedContacts);
      this.contactsRepository.addContact(event.contact);
    }
  }
}
