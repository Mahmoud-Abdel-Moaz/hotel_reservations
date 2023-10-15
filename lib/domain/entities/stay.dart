import 'package:equatable/equatable.dart';

import 'room.dart';

class Stay extends Equatable {
  final String name;
  final String description;
  final String? lat;
  final String? lng;
  final String? address;
  final String checkIn;
  final String checkOut;
  final int stars;
  final List<String> stayImages;
  final String amenities;
  final List<Room> rooms;

  const Stay(
      this.name,
      this.description,
      this.lat,
      this.lng,
      this.address,
      this.checkIn,
      this.checkOut,
      this.stars,
      this.stayImages,
      this.amenities,
      this.rooms);

  @override
  List<Object?> get props => [
        name,
        description,
        lat,
        lng,
        address,
        checkIn,
        checkOut,
        stars,
        stayImages,
        amenities,
        rooms
      ];
}
