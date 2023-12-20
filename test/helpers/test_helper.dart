import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:next_solutions/core/local/cache_helper.dart';
import 'package:next_solutions/core/platform/network_info.dart';
import 'package:next_solutions/data/data_sources/reservations_local_data_source.dart';
import 'package:next_solutions/data/data_sources/reservations_remote_data_source.dart';
import 'package:next_solutions/domain/repositories/reservations_repository.dart';
import 'package:next_solutions/domain/use_cases/get_reservations_use_case.dart';

@GenerateMocks(
  [
    CacheHelper,
    ReservationRepository,
    ReservationsRemoteDataSource,
    ReservationsLocalDataSource,
    NetworkInfo,
    GetReservationsUseCase
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
