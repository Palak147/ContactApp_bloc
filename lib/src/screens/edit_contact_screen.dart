import 'dart:io';
import 'package:ContactsApp/src/bloc/blocs.dart';
import 'package:ContactsApp/src/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class EditContactScreen extends StatefulWidget {
  static const routeName = 'EditContactScreen';

  @override
  _EditContactScreenState createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  bool isEditing = false;
  Contact contact;
  String _name;
  String _landline;
  String _mobile;
  String _imageUrl = '';
  bool _isFav = false;
  File _image;
  final uuid = Uuid();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    contact = ModalRoute.of(context).settings.arguments as Contact;

    if (contact != null) {
      isEditing = true;
    } else {
      contact = new Contact();
    }
    if (isEditing) _imageUrl = contact.imageUrl;
    final appBar = AppBar(
      title: isEditing ? Text('Update Contact') : Text('Add New Contact'),
      actions: <Widget>[
        IconButton(
            icon: contact.isFav ? Icon(Icons.star) : Icon(Icons.star_border),
            onPressed: () => _isFav = !contact.isFav)
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            cameraWidget(context, appBar),
            contactFormWidget(context, appBar),
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
            width: double.infinity,
            //color: Colors.pink,
            //padding: const EdgeInsets.all(2.0),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: double.infinity,
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.3,
                  child: _imageUrl == ''
                      ? Icon(
                          Icons.person,
                          size: 200,
                          color: Theme.of(context).primaryColor,
                        )
                      : Image.file(
                          File(_imageUrl),
                          fit: BoxFit.cover,
                        ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Container(
                    color: Colors.transparent,
                    child: IconButton(
                        icon: Icon(Icons.camera_alt),
                        color: Colors.blue,
                        onPressed: _takePicture),
                  ),
                ),

                //IconButton(icon: Icon(Icons.camera_alt), onPressed: null)
              ],
            ),
            // decoration:
            //     new BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            // child: _imageUrl == ''
            //     ? CircleAvatar(
            //         backgroundColor: Colors.white,
            //         radius: 40,
            //         child: IconButton(
            //           icon: Icon(Icons.camera_alt),
            //           iconSize: 32,
            //           onPressed: _takePicture,
            //         ),
            //       )
            //     : Image.file(File(_imageUrl)),
          ),
        ],
      ),
    );
  }

  Widget contactFormWidget(BuildContext context, AppBar appBar) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          nameField(),
          mobileField(),
          landlineField(),
          saveButton(context),
        ],
      ),
    );
  }

  Widget nameField() {
    return TextFormField(
      initialValue: contact.name,
      onChanged: (value) => _name = value,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Name',
      ),
    );
  }

  Widget mobileField() {
    return TextFormField(
      initialValue: contact.mobile,
      onChanged: (value) => _mobile = value,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Mobile',
      ),
    );
  }

  Widget landlineField() {
    return TextFormField(
      initialValue: contact.landline,
      onChanged: (value) => _landline = value,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Landline',
      ),
    );
  }

  Widget saveButton(BuildContext context) {
    return BlocListener<ContactsBloc, ContactsState>(
      listener: (context, state) {
        if (state is AddingContactComplete) {
          Navigator.of(context).pop();
        }
      },
      child: RaisedButton(
          child: Text('save'),
          color: Colors.blue,
          onPressed: () {
            Contact newContact = new Contact(
                id: isEditing ? contact.id : uuid.v4(),
                name: isEditing && _name == null ? _name = contact.name : _name,
                mobile: isEditing && _mobile == null
                    ? _mobile = contact.mobile
                    : _mobile,
                landline: isEditing && _landline == null
                    ? _landline = contact.landline
                    : _landline,
                imageUrl: _imageUrl,
                isFav: _isFav);
            BlocProvider.of<ContactsBloc>(context).add(
                isEditing ? UpdateContact(newContact) : AddContact(newContact));
          }),
    );
  }

  Future<void> _takePicture() async {
    final picker = new ImagePicker();
    final PickedFile imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile != null) {
      final appDir = await syspaths.getApplicationDocumentsDirectory();
      final fileName = path.basename(imageFile.path);
      _image = File(imageFile.path);
      await _image
          .copy('${appDir.path}/$fileName')
          .then((value) => setState(() {
                _imageUrl = value.path;
              }));
    }
    // _imageUrl = base64Encode(_image.readAsBytesSync());
    //return imageFile.path;
  }
}
