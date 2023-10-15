import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constanse/constanse.dart';
import '../../core/fonts.dart';
import '../../domain/entities/reservation.dart';
import 'stay_view.dart';
import 'tickets_view.dart';

class ReservationItemView extends StatelessWidget {
  final Reservation reservation;
  const ReservationItemView({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From',
                    style: Fonts.sFProDisplay(
                        18.sp, colorScheme.primary, FontWeight.w700),
                    textScaleFactor: 1,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    convertDate(input: reservation.startDate),
                    style: Fonts.sFProDisplay(
                        15.sp, colorScheme.primary, FontWeight.w400),
                    textScaleFactor: 1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Till',
                    style: Fonts.sFProDisplay(
                        18.sp, colorScheme.primary, FontWeight.w700),
                    textScaleFactor: 1,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    convertDate(input: reservation.endDate),
                    style: Fonts.sFProDisplay(
                        15.sp, colorScheme.primary, FontWeight.w400),
                    textScaleFactor: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 40.h),
        ListView.separated(
          itemBuilder: (ctx, index) => StayItemView(
            stay: reservation.stays[index],
          ),
          separatorBuilder: (ctx, index) => Column(
            children: [
              SizedBox(height: 40.h),
              DottedLine(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: colorScheme.inverseSurface,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
              SizedBox(height: 40.h),
            ],
          ),
          itemCount: reservation.stays.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        ),
        if (reservation.userTickets != null &&
            reservation.userTickets!.isNotEmpty)
          Column(
            children: [
              SizedBox(height: 40.h),
              DottedLine(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: colorScheme.inverseSurface,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
              SizedBox(height: 40.h),
            ],
          ),
        if (reservation.userTickets != null &&
            reservation.userTickets!.isNotEmpty)
          TicketsView(
            userTickets: reservation.userTickets!,
          )
      ],
    );
  }
}
