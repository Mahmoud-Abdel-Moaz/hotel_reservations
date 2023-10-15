import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/fonts.dart';

class StaticTicketItemView extends StatelessWidget {
  const StaticTicketItemView({super.key});

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
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
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
                    'Bridges James',
                    style: Fonts.sFProDisplay(
                        18.sp, colorScheme.primary, FontWeight.w700),
                    textScaleFactor: 1,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '#170122708123',
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
                'MATCH Business Seat',
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
                'Block 112 / Row S / Seat 1',
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
