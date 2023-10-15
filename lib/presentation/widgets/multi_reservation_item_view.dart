import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/fonts.dart';
import '../../domain/entities/reservation.dart';
import '../bloc/reservation_cubit.dart';
import 'reservation_view.dart';

class MultiReservationItemView extends StatelessWidget {
  final Reservation reservation;
  final int index;
  const MultiReservationItemView(
      {super.key, required this.reservation, required this.index});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    ReservationCubit reservationCubit = ReservationCubit.get(context);
    bool isExpanded = (reservationCubit.selectedReservation == index);
    return Container(
      padding:
          EdgeInsets.only(top: 15.h, bottom: 20.h, right: 15.w, left: 15.h),
      color: colorScheme.surfaceTint,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              reservationCubit
                  .changeSelectedReservation(isExpanded ? -1 : index);
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    size: 30.r,
                    color: colorScheme.primary,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Hotel Name',
                    style: Fonts.sFProDisplay(
                        18.sp, colorScheme.primary, FontWeight.w700),
                    textScaleFactor: 1,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.h),
              color: colorScheme.inverseSurface,
              height: 1.h,
              width: double.infinity,
            ),
          if (isExpanded)
            ReservationItemView(
              reservation: reservation,
            ),
        ],
      ),
    );
  }
}
