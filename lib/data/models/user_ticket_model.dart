import '../../domain/entities/user_ticket.dart';
import 'ticket_user_data_model.dart';

class UserTicketModel extends UserTicket {
  const UserTicketModel(super.ticketId, super.seat, super.ticketSystemId,
      super.ticketTypeName, super.gate, super.ticketUserData);

  factory UserTicketModel.fromJson(Map<String, dynamic> json) {
    return UserTicketModel(
        json['ticket_id'],
        json['seat'],
        json['ticket_system_id'],
        json['ticket_type_name'],
        json['gate'],
        TicketUserDataModel.fromJson(json['ticket_user_data']));
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['ticket_id'] = ticketId;
    json['seat'] = seat;
    json['ticket_system_id'] = ticketSystemId;
    json['ticket_type_name'] = ticketTypeName;
    json['gate'] = gate;
    json['ticket_user_data'] = TicketUserDataModel(
            ticketUserData.firstName,
            ticketUserData.lastName,
            ticketUserData.avatar,
            ticketUserData.isUser)
        .toJson();
    return json;
  }
}
