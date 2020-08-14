import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String id;
  final String name;
  final String mobile;
  final String landline;
  final bool isFav;
  final String imageUrl;
  Contact({
    this.id,
    this.name,
    this.mobile,
    this.landline,
    this.imageUrl = '',
    this.isFav = false,
  });
  //this.imageUrl = null});

  Contact.fromDb(Map<String, dynamic> dbVal)
      : id = dbVal['id'],
        name = dbVal['name'],
        mobile = dbVal['mobile'],
        landline = dbVal['landline'],
        imageUrl = dbVal['imageUrl'],
        isFav = dbVal['isFav'] == 1;

  Map<String, dynamic> toDb() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "mobile": mobile,
      "landline": landline,
      "imageUrl": imageUrl,
      "isFav": isFav ? 1 : 0
    };
  }

  @override
  List<Object> get props => [
        name,
        mobile,
        landline,
        isFav,
        imageUrl,
      ];

  @override
  String toString() {
    return 'Contact { id: $id, name :$name, mobile:$mobile, landline:$landline, isFav:$isFav, imageUrl:$imageUrl }';
  }
}
