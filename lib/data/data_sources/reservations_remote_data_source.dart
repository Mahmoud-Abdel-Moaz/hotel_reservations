import 'dart:convert';

import '../../../../core/error/exceptions.dart';
import '../../../../core/services/http_service.dart';
import '../models/reservation_model.dart';

abstract class ReservationsRemoteDataSource {
  Future<List<ReservationModel>> getReservations();
}

class ReservationsRemoteDataSourceImp implements ReservationsRemoteDataSource {
  @override
  Future<List<ReservationModel>> getReservations() async {
    try {
      String url =
          'https://qa-testing-backend-293b1363694d.herokuapp.com//api/v3/mobile-guests/user-events';
      final response = await HttpService.getData(url);
      if (response.statusCode == 200) {
        //reservations
        List<ReservationModel> reservations = [];
        reservations = (jsonDecode(response.body)['reservations'] as List)
            .map((i) => ReservationModel.fromJson(i))
            .toList();
        return reservations;
      } else {
        throw ServerException();
      }
    } catch (e) {
      print('remote error $e');
      throw ServerException();
    }
  }
}
