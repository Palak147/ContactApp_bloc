import 'package:ContactsApp/src/models/contact.dart';

abstract class ContactRepository {
  Future<List<Contact>> fetchContacts();
  Future<List<Contact>> fetchFavContacts();
  Future<void> addContact(Contact contact);
  Future<int> updateContact(Contact contact);
  Future<int> deleteContactById(String id);
}
