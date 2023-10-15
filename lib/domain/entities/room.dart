import 'package:equatable/equatable.dart';

import 'guest.dart';

class Room extends Equatable {
  final String roomNumber;
  final int roomCapacity;
  final String roomTypeName;
  final String stayName;
  final List<Guest> guests;

  const Room(this.roomNumber, this.roomCapacity, this.roomTypeName,
      this.stayName, this.guests);

  @override
  List<Object?> get props =>
      [roomNumber, roomCapacity, roomTypeName, stayName, guests];
}
