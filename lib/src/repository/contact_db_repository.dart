import 'dart:io';
import 'package:path/path.dart';
import 'package:ContactsApp/src/models/contact.dart';
import 'package:ContactsApp/src/repository/contact_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class ContactDbRepository implements ContactRepository {
  Database _db;

  static var uuid = Uuid();
  //Dummy Contacts
  List<Contact> dummyContacts = new List<Contact>();

  void addDummyContacts() {
    Contact c1 = new Contact(
        id: uuid.v4(), name: 'A', mobile: '9560514060', landline: '1');
    dummyContacts.add(c1);
    Contact c2 = new Contact(
        id: uuid.v4(), name: 'B', mobile: '9560514060', landline: '1');
    dummyContacts.add(c2);
    Contact c3 = new Contact(
        id: uuid.v4(), name: 'C', mobile: '9560514060', landline: '1');
    dummyContacts.add(c3);
    Contact c4 = new Contact(
        id: uuid.v4(), name: 'D', mobile: '9560514060', landline: '1');
    dummyContacts.add(c4);
    Contact c5 = new Contact(
        id: uuid.v4(), name: 'E', mobile: '9560514060', landline: '1');
    dummyContacts.add(c5);
  }

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await init();

    return _db;
  }

  init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "contacts.db");
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute("""
        CREATE TABLE Contacts(
          id TEXT PRIMARY KEY,
          name TEXT,
          mobile TEXT,
          landline TEXT,
          imageUrl TEXT,
          isFav INTEGER
        )

        """);
      },
    );
    return db;
  }

  @override
  Future<List<Contact>> fetchContacts() async {
    var dbClient = await db;
    final maps = await dbClient.query(
      "Contacts",
      columns: null,
    );
    if (maps.length > 0) {
      return List<Contact>.from(maps.map((contact) => Contact.fromDb(contact)));
    }
    return null;
  }

  @override
  Future<List<Contact>> fetchFavContacts() async {
    var dbClient = await db;
    final maps =
        await dbClient.query("Contacts", columns: null, where: "isFav = 1");
    if (maps.length > 0) {
      return List<Contact>.from(maps.map((contact) => Contact.fromDb(contact)));
    }
    return null;
  }

  @override
  Future<void> addContact(Contact contact) async {
    var dbClient = await db;
    dbClient.insert("Contacts", contact.toDb());
  }

  @override
  Future<int> updateContact(Contact contact) async {
    var dbClient = await db;
    return await dbClient.update(
      "Contacts",
      contact.toDb(),
      where: "id = ?",
      whereArgs: [contact.id],
    );
  }

  @override
  Future<int> deleteContactById(String id) async {
    var dbClient = await db;
    return await dbClient.delete("Contacts", where: "id = ?", whereArgs: [id]);
  }
}
