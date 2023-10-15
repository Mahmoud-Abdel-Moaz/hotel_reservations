import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/local/cache_helper.dart';
import '../../core/local/keys.dart';
import '../models/reservation_model.dart';

abstract class ReservationsLocalDataSource {
  Future<List<ReservationModel>> getCachedReservations();

  Future<Unit> cacheReservations(List<ReservationModel> reservations);
}

class ReservationsLocalDataSourceImp implements ReservationsLocalDataSource {
  @override
  Future<Unit> cacheReservations(List<ReservationModel> reservations) {
    try {
      List<Map<String, dynamic>> json =
          reservations.map((reservation) => reservation.toJson()).toList();
      CacheHelper.saveData(key: RESERVATIONS, value: jsonEncode(json));
    } catch (e) {
      print('cashed error $e');
    }

    return Future.value(unit);
  }

  @override
  Future<List<ReservationModel>> getCachedReservations() {
    final String? jsonString = CacheHelper.getData(key: RESERVATIONS);

    if (jsonString != null && jsonString.isNotEmpty) {
      List<ReservationModel> reservations = [];
      reservations = (jsonDecode(jsonString) as List)
          .map((i) => ReservationModel.fromJson(i))
          .toList();
      return Future.value(reservations);
    } else {
      throw EmptyCacheException();
    }
  }
}
