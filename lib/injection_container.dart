import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/platform/network_info.dart';
import 'data/data_sources/reservations_local_data_source.dart';
import 'data/data_sources/reservations_remote_data_source.dart';
import 'data/repositories/reservation_repository_imp.dart';
import 'domain/repositories/reservations_repository.dart';
import 'domain/use_cases/get_reservations_use_case.dart';
import 'presentation/bloc/reservation_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Features - Reservations

  // Bloc
  sl.registerFactory(() => ReservationCubit(sl()));

  // UseCases
  sl.registerLazySingleton(() => GetReservationsUseCase(sl()));
  //Repository
  sl.registerLazySingleton<ReservationRepository>(() =>
      ReservationRepositoryImp(
          remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  //DataSources
  sl.registerLazySingleton<ReservationsRemoteDataSource>(
      () => ReservationsRemoteDataSourceImp(client: sl()));
  sl.registerLazySingleton<ReservationsLocalDataSource>(
      () => ReservationsLocalDataSourceImp());

  /// Core

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  ///External
  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
