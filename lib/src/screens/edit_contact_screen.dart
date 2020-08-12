import 'package:ContactsApp/src/bloc/blocs.dart';
import 'package:ContactsApp/src/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class EditContactScreen extends StatefulWidget {
  static const routeName = 'EditContactScreen';

  @override
  _EditContactScreenState createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController landlineController = TextEditingController();

  final uuid = Uuid();
  var contactsBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    contactsBloc = BlocProvider.of<ContactsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Add New Contact'),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.star_border), onPressed: () => print('pressed'))
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            cameraWidget(context, appBar),
            contactFormWidget(context, appBar, contactsBloc),
          ],
        ),
      ),
    );
  }

  Widget cameraWidget(BuildContext context, AppBar appBar) {
    return Container(
      width: double.infinity,
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.all(2.0),
            decoration:
                new BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: IconButton(
                icon: Icon(Icons.camera_alt),
                iconSize: 32,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget contactFormWidget(
      BuildContext context, AppBar appBar, ContactsBloc bloc) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          nameField(),
          mobileField(),
          landlineField(),
          saveButton(bloc, context),
        ],
      ),
    );
  }

  Widget nameField() {
    return TextFormField(
      //initialValue: contact.name,
      controller: nameController,
      onChanged: null,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Name',
        //errorText: snapshot.error,
      ),
    );
  }

  Widget mobileField() {
    return TextFormField(
      controller: mobileController,
      //onChanged: bloc.changeMobile,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Mobile',
        //errorText: snapshot.error,
      ),
    );
  }

  Widget landlineField() {
    return TextFormField(
      //initialValue: contact.landline,
      //onChanged: bloc.changeLandline,
      controller: landlineController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Landline',
        //errorText: snapshot.error,
      ),
    );
  }

  Widget saveButton(ContactsBloc bloc, BuildContext context) {
    return RaisedButton(
        child: Text('save'),
        color: Colors.blue,
        onPressed: () {
          Contact contact = new Contact(
            id: uuid.v4(),
            name: nameController.text,
            mobile: mobileController.text,
            landline: landlineController.text,
          );
          bloc.add(AddContact(contact));
          Navigator.pop(context);
        });
  }
}

//   Widget updateButton(ContactBloc bloc, Contact contact) {
//     return StreamBuilder(
//       stream: bloc.saveValid,
//       builder: (context, snapshot) {
//         return RaisedButton(
//           child: Text('Update'),
//           color: Colors.blue,
//           onPressed: snapshot.hasData
//               ? () {
//                   bloc.updateContact(contact.id);
//                   Navigator.of(context).pop(MaterialPageRoute(
//                     builder: (context) {
//                       return ContactListScreen();
//                     },
//                   ));
//                 }
//               : null,
//         );
//       },
//     );
//   }
// }
