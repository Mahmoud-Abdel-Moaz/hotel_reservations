import '../../domain/entities/stay.dart';
import 'room_model.dart';

class StayModel extends Stay {
  const StayModel(
      super.name,
      super.description,
      super.lat,
      super.lng,
      super.address,
      super.checkIn,
      super.checkOut,
      super.stars,
      super.stayImages,
      super.amenities,
      super.rooms);

  factory StayModel.fromJson(Map<String, dynamic> json) {
    return StayModel(
        json['name'],
        json['description'],
        json['lat'],
        json['lng'],
        json['address'],
        json['check_in'],
        json['check_out'],
        json['stars'],
        //  [] /*json['stay_images']*/,
        json['stay_images'] != null
            ? (json['stay_images'] as List).map((i) => i.toString()).toList()
            : [],
        json['amenities'],
        json['rooms'] != null
            ? (json['rooms'] as List).map((i) => RoomModel.fromJson(i)).toList()
            : []);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = name;
    json['description'] = description;
    json['address'] = address;
    json['lat'] = lat;
    json['lng'] = lng;
    json['check_in'] = checkIn;
    json['check_out'] = checkOut;
    json['stars'] = stars;
    json['stay_images'] = stayImages;
    json['amenities'] = amenities;
    json['rooms'] = rooms
        .map((room) => RoomModel(room.roomNumber, room.roomCapacity,
                room.roomTypeName, room.stayName, room.guests)
            .toJson())
        .toList();
    return json;
  }
}
