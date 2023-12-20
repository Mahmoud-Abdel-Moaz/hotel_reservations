import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:next_solutions/data/models/reservation_model.dart';
import 'package:next_solutions/domain/use_cases/get_reservations_use_case.dart';

import '../../../helpers/json_reader.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetReservationsUseCase getReservationsUseCase;
  late MockReservationRepository mockReservationRepository;

  setUp(() {
    mockReservationRepository = MockReservationRepository();
    getReservationsUseCase = GetReservationsUseCase(mockReservationRepository);
  });

  test('should get reservations list from the repository', () async {
    //arrange
    List<ReservationModel> tReservations =
        (jsonDecode(readJson('helpers/dummy_data/reservations_response.json'))[
                'reservations'] as List)
            .map((i) => ReservationModel.fromJson(i))
            .toList();
    when(mockReservationRepository.getReservations())
        .thenAnswer((_) async => Right(tReservations));

    //act
    final result = await getReservationsUseCase();
    //assert
    expect(result, Right(tReservations));
  });
}
