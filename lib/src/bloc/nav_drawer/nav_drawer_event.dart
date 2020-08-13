import 'package:ContactsApp/src/models/nav_item.dart';
import 'package:equatable/equatable.dart';

abstract class NavDrawerEvent extends Equatable {
  const NavDrawerEvent();
}

class UpdateNavigation extends NavDrawerEvent {
  final NavItem destination;

  const UpdateNavigation(this.destination);

  @override
  List<Object> get props => [destination];
}
