import 'package:equatable/equatable.dart';

import 'ticket_user_data.dart';

class UserTicket extends Equatable {
  final int ticketId;
  final String seat, ticketSystemId, ticketTypeName, gate;
  final TicketUserData ticketUserData;

  const UserTicket(this.ticketId, this.seat, this.ticketSystemId,
      this.ticketTypeName, this.gate, this.ticketUserData);

  @override
  List<Object?> get props =>
      [ticketId, seat, ticketSystemId, ticketTypeName, gate, ticketUserData];
}
