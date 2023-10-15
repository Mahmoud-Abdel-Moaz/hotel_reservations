part of 'reservation_cubit.dart';

abstract class ReservationState extends Equatable {
  const ReservationState();
}

class ReservationInitial extends ReservationState {
  @override
  List<Object> get props => [];
}

class LoadingReservationsState extends ReservationState {
  @override
  List<Object?> get props => [];
}

class LoadedReservationsState extends ReservationState {
  final List<Reservation> reservations;

  const LoadedReservationsState(this.reservations);

  @override
  List<Object?> get props => [reservations];
}

class ErrorReservationsState extends ReservationState {
  final String errorMessage;

  const ErrorReservationsState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class ChangeSelectedReservationState extends ReservationState {
  final int id;
  const ChangeSelectedReservationState(this.id);
  @override
  List<Object?> get props => [id];
}

class ChangeThemeModeState extends ReservationState {
  final ThemeMode themeMode;
  const ChangeThemeModeState(this.themeMode);
  @override
  List<Object?> get props => [themeMode];
}
