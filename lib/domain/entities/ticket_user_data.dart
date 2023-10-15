import 'package:equatable/equatable.dart';

class TicketUserData extends Equatable {
  final String firstName, lastName, avatar;
  final bool isUser;

  const TicketUserData(this.firstName, this.lastName, this.avatar, this.isUser);

  @override
  List<Object?> get props => [firstName, lastName, avatar, isUser];
}
