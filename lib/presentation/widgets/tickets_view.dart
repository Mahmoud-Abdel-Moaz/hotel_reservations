import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/fonts.dart';
import '../../domain/entities/user_ticket.dart';
import 'ticket_item_view.dart';

class TicketsView extends StatelessWidget {
  final List<UserTicket> userTickets;
  const TicketsView({super.key, required this.userTickets});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Tickets:',
          style:
              Fonts.sFProDisplay(18.sp, colorScheme.primary, FontWeight.w700),
          textScaleFactor: 1,
        ),
        SizedBox(
          height: 10.h,
        ),
        ListView.separated(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (ctx, index) => TicketItemView(
            userTicket: userTickets[index],
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
          itemCount: userTickets.length,
        ),
      ],
    );
  }
}
