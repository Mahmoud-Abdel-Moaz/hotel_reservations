import '../../domain/entities/reservation.dart';
import 'stay_model.dart';
import 'user_ticket_model.dart';

class ReservationModel extends Reservation {
  const ReservationModel(
      super.id, super.startDate, super.endDate, super.stays, super.userTickets);

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
        json['id'],
        json['start_date'],
        json['end_date'],
        json['stays'] != null
            ? (json['stays'] as List).map((i) => StayModel.fromJson(i)).toList()
            : [],
        json['user_tickets'] != null
            ? (json['user_tickets'] as List)
                .map((i) => UserTicketModel.fromJson(i))
                .toList()
            : null);
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['start_date'] = startDate;
    json['end_date'] = endDate;
    json['stays'] = stays
        .map((stay) => StayModel(
                stay.name,
                stay.description,
                stay.lat,
                stay.lng,
                stay.address,
                stay.checkIn,
                stay.checkOut,
                stay.stars,
                stay.stayImages,
                stay.amenities,
                stay.rooms)
            .toJson())
        .toList();
    if (userTickets != null) {
      json['user_tickets'] = userTickets!
          .map((userTicket) => UserTicketModel(
                  userTicket.ticketId,
                  userTicket.seat,
                  userTicket.ticketSystemId,
                  userTicket.ticketTypeName,
                  userTicket.gate,
                  userTicket.ticketUserData)
              .toJson())
          .toList();
    }
    return json;
  }
}
