import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/fonts.dart';
import '../../domain/entities/room.dart';
import 'guest_item_view.dart';

class RoomItemView extends StatelessWidget {
  final Room room;

  const RoomItemView({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 40.h,
        ),
        Text(room.stayName,
            style:
                Fonts.sFProDisplay(18.sp, colorScheme.primary, FontWeight.w700),
            textScaleFactor: 1),
        if (room.guests.isNotEmpty) SizedBox(height: 35.h),
        if (room.guests.isNotEmpty)
          Text('Guest(s):',
              style: Fonts.sFProDisplay(
                  18.sp, colorScheme.primary, FontWeight.w700),
              textScaleFactor: 1),
        ListView.separated(
            padding: EdgeInsets.only(top: 10.h),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (ctx, index) =>
                GuestItemView(guest: room.guests[index]),
            separatorBuilder: (ctx, index) => SizedBox(
                  height: 10.h,
                ),
            itemCount: room.guests.length),
        SizedBox(height: 35.h),
        Text('Room Type',
            style:
                Fonts.sFProDisplay(18.sp, colorScheme.primary, FontWeight.w700),
            textScaleFactor: 1),
        SizedBox(height: 6.h),
        Text(room.roomTypeName,
            style:
                Fonts.sFProDisplay(15.sp, colorScheme.primary, FontWeight.w400),
            textScaleFactor: 1),
        SizedBox(
          height: 35.h,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Room Number',
                      style: Fonts.sFProDisplay(
                          18.sp, colorScheme.primary, FontWeight.w700),
                      textScaleFactor: 1),
                  SizedBox(height: 6.h),
                  Text(room.roomNumber,
                      style: Fonts.sFProDisplay(
                          15.sp, colorScheme.primary, FontWeight.w400),
                      textScaleFactor: 1),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Sleeps',
                      style: Fonts.sFProDisplay(
                          18.sp, colorScheme.primary, FontWeight.w700),
                      textScaleFactor: 1),
                  SizedBox(height: 6.h),
                  Text(room.roomCapacity.toString(),
                      style: Fonts.sFProDisplay(
                          15.sp, colorScheme.primary, FontWeight.w400),
                      textScaleFactor: 1),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40.h,
        ),
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
      ],
    );
  }
}
