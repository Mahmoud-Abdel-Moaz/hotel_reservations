import '../../domain/entities/room.dart';
import 'guest_model.dart';

class RoomModel extends Room {
  const RoomModel(super.roomNumber, super.roomCapacity, super.roomTypeName,
      super.stayName, super.guests);

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
        json['room_number'],
        json['room_capacity'],
        json['room_type_name'],
        json['stay_name'],
        json['guests'] != null
            ? (json['guests'] as List)
                .map((i) => GuestModel.fromJson(i))
                .toList()
            : []);
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['room_number'] = roomNumber;
    json['room_capacity'] = roomCapacity;
    json['room_type_name'] = roomTypeName;
    json['stay_name'] = stayName;
    json['room_type_name'] = roomTypeName;
    json['guests'] = guests
        .map((guest) =>
            GuestModel(guest.firstName, guest.lastName, guest.avatar).toJson())
        .toList();
    return json;
  }
}
