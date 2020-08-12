import 'dart:async';
import 'package:ContactsApp/src/bloc/blocs.dart';
import 'package:bloc/bloc.dart';
import './nav_drawer_event.dart';
import './nav_drawer_state.dart';

class NavDrawerBloc extends Bloc<NavDrawerEvent, NavDrawerState> {
  NavDrawerBloc() : super(InitialNavState());

  @override
  Stream<NavDrawerState> mapEventToState(
    NavDrawerEvent event,
  ) async* {
    if (event is UpdateNavigation) {
      if (event.destination != state.selectedItem) {
        yield NavDrawerState(event.destination);
      }
    }
  }
}
