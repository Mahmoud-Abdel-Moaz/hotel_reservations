import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:next_solutions/constanse/constanse.dart';
import 'package:next_solutions/core/error/exceptions.dart';
import 'package:next_solutions/core/platform/endPoints.dart';
import 'package:next_solutions/data/data_sources/reservations_remote_data_source.dart';
import 'package:next_solutions/data/models/reservation_model.dart';

import '../../../helpers/json_reader.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late ReservationsRemoteDataSourceImp reservationsRemoteDataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    reservationsRemoteDataSource =
        ReservationsRemoteDataSourceImp(client: mockHttpClient);
  });

  group('Get Reservations', () {
    test('should return model when the response code is 200', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(userEvents), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      })).thenAnswer((_) async => http.Response(
          readJson('helpers/dummy_data/reservations_response.json'), 200));

      //act
      final reservations = await reservationsRemoteDataSource.getReservations();
      //assert
      expect(reservations, isA<List<ReservationModel>>());
    });

    test(
        'should throw a server exception when the response code is 404 or other',
        () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(userEvents), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      })).thenAnswer((_) async => http.Response('Not Found', 404));
      //act
      final result = reservationsRemoteDataSource.getReservations();
      //assert
      expect(result, throwsA(isA<ServerException>()));
    });

    test(
        'should throw a NotAuthorized exception when the response code is 401 or other',
        () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(userEvents), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      })).thenAnswer((_) async =>
          http.Response("Not Allowed , Please back to support", 401));
      //act
      final result = reservationsRemoteDataSource.getReservations();
      //assert
      expect(result, throwsA(isA<NotAuthorizedException>()));
    });
  });
}
