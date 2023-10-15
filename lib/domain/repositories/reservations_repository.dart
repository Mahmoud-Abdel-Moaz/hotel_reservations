import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/reservation.dart';

abstract class ReservationRepository {
  Future<Either<Failure, List<Reservation>>> getReservations();
}
