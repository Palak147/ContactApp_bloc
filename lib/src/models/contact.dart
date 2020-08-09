import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Contact extends Equatable {
  final String id;
  final String name;
  final String mobile;
  final String landline;
  final bool isFav;
  //final String imageUrl;

  Contact({
    @required this.id,
    @required this.name,
    @required this.mobile,
    @required this.landline,
    this.isFav = false,
  });
  //this.imageUrl = null});

  Contact.fromDb(Map<String, dynamic> dbVal)
      : id = dbVal['id'],
        name = dbVal['name'],
        mobile = dbVal['mobile'],
        landline = dbVal['landline'],
        isFav = dbVal['isFav'] == 1;

  Map<String, dynamic> toDb() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "mobile": mobile,
      "landline": landline,
      "isFav": isFav ? 1 : 0
    };
  }

  @override
  List<Object> get props => [
        name,
        mobile,
        landline,
        isFav,
      ];

  @override
  String toString() {
    return 'Contact { id: $id, name :$name, mobile:$mobile, landline:$landline, isFav:$isFav }';
  }
}
