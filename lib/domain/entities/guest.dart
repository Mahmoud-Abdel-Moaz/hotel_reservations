import 'package:equatable/equatable.dart';

class Guest extends Equatable {
  final String firstName, lastName, avatar;

  const Guest(this.firstName, this.lastName, this.avatar);

  @override
  // TODO: implement props
  List<Object?> get props => [firstName, lastName, avatar];
}
