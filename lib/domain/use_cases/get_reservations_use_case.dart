import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/reservation.dart';
import '../repositories/reservations_repository.dart';

class GetReservationsUseCase {
  final ReservationRepository reservationRepository;

  GetReservationsUseCase(this.reservationRepository);

  Future<Either<Failure, List<Reservation>>> call() {
    return reservationRepository.getReservations();
  }
}
