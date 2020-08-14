import 'package:ContactsApp/src/bloc/blocs.dart';
import 'package:ContactsApp/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteContactScreen extends StatelessWidget {
  static const routeName = 'FavoriteContactScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Contacts'),
      ),
      drawer: NavDrawerWidget(),
      body: BlocBuilder<FavContactsBloc, FavContactsState>(
        builder: (context, state) {
          if (state is FavContactsLoading) {
            return LoadingIndicator();
          } else if (state is FavContactsLoaded) {
            return state.favContacts != null
                ? ContactList(state)
                : Text('Welcome to contact app');
          } else {
            return Text('Welcome to contact app');
          }
        },
      ),
    );
  }
}
