import 'package:equatable/equatable.dart';

import 'stay.dart';
import 'user_ticket.dart';

class Reservation extends Equatable {
  final int id;
  final String startDate;
  final String endDate;
  final List<Stay> stays;
  final List<UserTicket>? userTickets;

  const Reservation(
      this.id, this.startDate, this.endDate, this.stays, this.userTickets);

  @override
  List<Object?> get props => [id, startDate, endDate, stays, userTickets];
}
