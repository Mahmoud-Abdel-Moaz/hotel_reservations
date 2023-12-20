import 'package:dartz/dartz.dart';
import 'package:next_solutions/core/error/failure.dart';
import 'package:next_solutions/domain/entities/reservation.dart';

import '../../core/error/exceptions.dart';
import '../../core/platform/network_info.dart';
import '../../domain/repositories/reservations_repository.dart';
import '../data_sources/reservations_local_data_source.dart';
import '../data_sources/reservations_remote_data_source.dart';

class ReservationRepositoryImp extends ReservationRepository {
  final ReservationsRemoteDataSource remoteDataSource;
  final ReservationsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ReservationRepositoryImp(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Reservation>>> getReservations() async {
    if (await networkInfo.isConnected) {
      try {
        final reservations = await remoteDataSource.getReservations();
        localDataSource.cacheReservations(reservations);
        return Right(reservations);
      } on ServerException {
        return Left(ServerFailure());
      } on NotAuthorizedException {
        return Left(NotAuthorizedFailure());
      }
    } else {
      try {
        final reservations = await localDataSource.getCachedReservations();
        return Right(reservations);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
