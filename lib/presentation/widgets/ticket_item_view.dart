import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/fonts.dart';
import '../../domain/entities/user_ticket.dart';

class TicketItemView extends StatelessWidget {
  final UserTicket userTicket;
  const TicketItemView({super.key, required this.userTicket});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      color: colorScheme.surface,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 34.r,
                height: 34.r,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(userTicket.ticketUserData.avatar),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white)),
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${userTicket.ticketUserData.firstName} ${userTicket.ticketUserData.lastName}',
                    style: Fonts.sFProDisplay(
                        18.sp, colorScheme.primary, FontWeight.w700),
                    textScaleFactor: 1,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '#${userTicket.ticketSystemId}',
                    style: Fonts.sFProDisplay(
                        15.sp, colorScheme.surfaceVariant, FontWeight.w400),
                    textScaleFactor: 1,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          DottedLine(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: colorScheme.background,
            dashGapLength: 4.0,
            dashGapColor: Colors.transparent,
            dashGapRadius: 0.0,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Ticket Type:',
                style: Fonts.sFProDisplay(
                    15.sp, colorScheme.primary, FontWeight.w400),
                textScaleFactor: 1,
              ),
              SizedBox(width: 5.w),
              Text(
                userTicket.ticketTypeName,
                style: Fonts.sFProDisplay(
                    15.sp, colorScheme.surfaceVariant, FontWeight.w400),
                textScaleFactor: 1,
              ),
            ],
          ),
          SizedBox(
            height: 6.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Seat:',
                style: Fonts.sFProDisplay(
                    15.sp, colorScheme.primary, FontWeight.w400),
                textScaleFactor: 1,
              ),
              SizedBox(width: 5.w),
              Text(
                'gete  ${userTicket.gate} / Seat ${userTicket.seat}',
                style: Fonts.sFProDisplay(
                    15.sp, colorScheme.surfaceVariant, FontWeight.w400),
                textScaleFactor: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
