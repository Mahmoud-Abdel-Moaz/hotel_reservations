import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../../constanse/constanse.dart';
import '../../core/platform/endPoints.dart';
import '../models/reservation_model.dart';

abstract class ReservationsRemoteDataSource {
  Future<List<ReservationModel>> getReservations();
}

class ReservationsRemoteDataSourceImp extends ReservationsRemoteDataSource {
  final http.Client client;
  ReservationsRemoteDataSourceImp({required this.client});
  @override
  Future<List<ReservationModel>> getReservations() async {
    final response = await client.get(Uri.parse(userEvents), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      List<ReservationModel> reservations = [];
      reservations = (jsonDecode(response.body)['reservations'] as List)
          .map((i) => ReservationModel.fromJson(i))
          .toList();
      return reservations;
    } else if (response.statusCode == 401) {
      throw NotAuthorizedException();
    } else {
      throw ServerException();
    }
  }
}
