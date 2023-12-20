import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constanse/constanse.dart';
import '../../constanse/failuers.dart';
import '../../core/error/failure.dart';
import '../../core/local/keys.dart';
import '../../domain/entities/reservation.dart';
import '../../domain/use_cases/get_reservations_use_case.dart';
import '../pages/fun.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  final GetReservationsUseCase getReservationsUseCase;
  ReservationCubit(this.getReservationsUseCase) : super(ReservationInitial());

  static ReservationCubit get(context) => BlocProvider.of(context);
  int selectedReservation = -1;

  List<Reservation>? reservations;

  ThemeMode themeMode =
      selectedTheme == LIGHT_MODE ? ThemeMode.light : ThemeMode.dark;
  changeThemeMode() {
    changeTheme();
    themeMode = selectedTheme == LIGHT_MODE ? ThemeMode.light : ThemeMode.dark;
    emit(ChangeThemeModeState(themeMode));
  }

  changeSelectedReservation(int id) {
    selectedReservation = id;
    emit(ChangeSelectedReservationState(id));
  }

  getReservations() async {
    changeSelectedReservation(-1);
    emit(LoadingReservationsState());
    final failureOrReservation = await getReservationsUseCase();
    emit(_mapFailureOrReservationsToState(failureOrReservation));
  }

  ReservationState _mapFailureOrReservationsToState(
      Either<Failure, List<Reservation>> either) {
    return either.fold(
      (failure) => ErrorReservationsState(_mapFailureToMessage(failure)),
      (reservationsList) {
        reservations = reservationsList;
        return LoadedReservationsState(reservationsList);
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later";
    }
  }
}
