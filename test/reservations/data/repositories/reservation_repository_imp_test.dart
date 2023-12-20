import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:next_solutions/core/error/exceptions.dart';
import 'package:next_solutions/core/error/failure.dart';
import 'package:next_solutions/data/models/reservation_model.dart';
import 'package:next_solutions/data/repositories/reservation_repository_imp.dart';

import '../../../helpers/json_reader.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late ReservationRepositoryImp reservationRepositoryImp;
  late MockReservationsRemoteDataSource mockReservationsRemoteDataSource;
  late MockReservationsLocalDataSource mockReservationsLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockReservationsRemoteDataSource = MockReservationsRemoteDataSource();
    mockReservationsLocalDataSource = MockReservationsLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    reservationRepositoryImp = ReservationRepositoryImp(
        remoteDataSource: mockReservationsRemoteDataSource,
        localDataSource: mockReservationsLocalDataSource,
        networkInfo: mockNetworkInfo);
  });

  void runTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void runTestOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      body();
    });
  }

  group('get Reservations List', () {
    List<ReservationModel> tReservations =
        (jsonDecode(readJson('helpers/dummy_data/reservations_response.json'))[
                'reservations'] as List)
            .map((i) => ReservationModel.fromJson(i))
            .toList();

    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockReservationsRemoteDataSource.getReservations())
          .thenAnswer((_) async => tReservations);
      when(mockReservationsLocalDataSource.cacheReservations(tReservations))
          .thenAnswer((_) async => unit);
      // act
      await reservationRepositoryImp.getReservations();
      //assert
      verify(mockNetworkInfo.isConnected);
    });
    runTestOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        //arrange
        when(mockReservationsRemoteDataSource.getReservations())
            .thenAnswer((_) async => tReservations);
        when(mockReservationsLocalDataSource.cacheReservations(tReservations))
            .thenAnswer((_) async => unit);

        //act
        final result = await reservationRepositoryImp.getReservations();
        //assert
        verify(mockReservationsRemoteDataSource.getReservations());
        expect(result, equals(Right(tReservations)));
      });

      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        //arrange
        when(mockReservationsRemoteDataSource.getReservations())
            .thenAnswer((_) async => tReservations);
        when(mockReservationsLocalDataSource.cacheReservations(tReservations))
            .thenAnswer((_) async => unit);
        //act
        await reservationRepositoryImp.getReservations();
        //assert
        verify(mockReservationsRemoteDataSource.getReservations());
        verify(
            mockReservationsLocalDataSource.cacheReservations(tReservations));
      });

      test(
          'should return server failure and cash data local do not work when the call to remote data source is unsuccessful',
          () async {
        //arrange
        when(mockReservationsRemoteDataSource.getReservations())
            .thenThrow(ServerException());
        //act
        final result = await reservationRepositoryImp.getReservations();
        //assert
        verify(mockReservationsRemoteDataSource.getReservations());
        verifyZeroInteractions(mockReservationsLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
      test(
          'should return NotAuthorized failure and cash data local do not work when the call to remote data source is unsuccessful because  user not authorized',
          () async {
        //arrange
        when(mockReservationsRemoteDataSource.getReservations())
            .thenThrow(NotAuthorizedException());
        //act
        final result = await reservationRepositoryImp.getReservations();
        //assert
        verify(mockReservationsRemoteDataSource.getReservations());
        verifyZeroInteractions(mockReservationsLocalDataSource);
        expect(result, equals(Left(NotAuthorizedFailure())));
      });
    });
    runTestOffline(() {
      //arrange
      test(
          'should return last locally cached data when the cached data is present',
          () async {
        when(mockReservationsLocalDataSource.getCachedReservations())
            .thenAnswer((_) async => tReservations);
        //act
        final result = await reservationRepositoryImp.getReservations();
        //assert
        verifyZeroInteractions(mockReservationsRemoteDataSource);
        verify(mockReservationsLocalDataSource.getCachedReservations());
        expect(result, equals(Right(tReservations)));
      });
      //arrange
      test('should return CacheFailure when there is no data present',
          () async {
        /*   when(mockReservationsRemoteDataSource.getReservations())
            .thenThrow(ServerException());*/
        when(mockReservationsLocalDataSource.getCachedReservations())
            .thenThrow(EmptyCacheException());
        //act
        final result = await reservationRepositoryImp.getReservations();
        //assert
        verifyZeroInteractions(mockReservationsRemoteDataSource);
        verify(mockReservationsLocalDataSource.getCachedReservations());

        expect(result, equals(Left(EmptyCacheFailure())));
      });
    });
  });
}
