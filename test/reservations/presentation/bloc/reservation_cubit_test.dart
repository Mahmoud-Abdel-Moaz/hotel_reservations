import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:next_solutions/constanse/failuers.dart';
import 'package:next_solutions/core/error/failure.dart';
import 'package:next_solutions/data/models/reservation_model.dart';
import 'package:next_solutions/presentation/bloc/reservation_cubit.dart';

import '../../../helpers/json_reader.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late ReservationCubit reservationCubit;
  late MockGetReservationsUseCase mockGetReservationsUseCase;

  setUp(() {
    mockGetReservationsUseCase = MockGetReservationsUseCase();
    reservationCubit = ReservationCubit(mockGetReservationsUseCase);
  });
  group('Get Reservations', () {
    List<ReservationModel> tReservations =
        (jsonDecode(readJson('helpers/dummy_data/reservations_response.json'))[
                'reservations'] as List)
            .map((i) => ReservationModel.fromJson(i))
            .toList();
    test('reservations list Should be null in initialization', () async {
      expect(reservationCubit.reservations, isNull);
    });

    blocTest(
      'LoadingReservationsState state and  LoadedReservationsState  Should be return if useCase success',
      build: () {
        when(mockGetReservationsUseCase.call())
            .thenAnswer((_) async => Right(tReservations));
        return reservationCubit;
      },
      act: (bloc) async => await reservationCubit.getReservations(),
      expect: () => [
        const ChangeSelectedReservationState(-1),
        LoadingReservationsState(),
        LoadedReservationsState(tReservations)
      ],
    );

    blocTest(
      'LoadingReservationsState state and  ErrorReservationsState  Should be return if useCase un success',
      build: () {
        when(mockGetReservationsUseCase.call())
            .thenAnswer((_) async => Left(ServerFailure()));
        return reservationCubit;
      },
      act: (bloc) async => await reservationCubit.getReservations(),
      expect: () => [
        const ChangeSelectedReservationState(-1),
        LoadingReservationsState(),
        const ErrorReservationsState(SERVER_FAILURE_MESSAGE)
      ],
    );
  });
}
