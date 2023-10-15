import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/fonts.dart';
import '../../domain/entities/stay.dart';
import 'gallery_view.dart';
import 'location_view.dart';
import 'room_item_view.dart';

class StayItemView extends StatelessWidget {
  final Stay stay;

  const StayItemView({super.key, required this.stay});

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
                    'Stars',
                    style: Fonts.sFProDisplay(
                        18.sp, colorScheme.primary, FontWeight.w700),
                    textScaleFactor: 1,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < stay.stars; i++)
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18.r,
                              color: colorScheme.secondaryContainer,
                            ),
                            SizedBox(width: 3.w),
                          ],
                        )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Room Count',
                    style: Fonts.sFProDisplay(
                        18.sp, colorScheme.primary, FontWeight.w700),
                    textScaleFactor: 1,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    '${stay.rooms.length}',
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
        LocationView(
            name: stay.name,
            address: (stay.address ?? ''),
            lat: stay.lat,
            lng: stay.lng),
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
        ListView.builder(
          itemBuilder: (ctx, index) => RoomItemView(
            room: stay.rooms[index],
          ),
          itemCount: stay.rooms.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        ),
        SizedBox(
          height: 45.h,
        ),
        GalleryView(
          images: stay.stayImages,
        ),
        SizedBox(height: 40.h),
        Text(
          'Amenities',
          style:
              Fonts.sFProDisplay(18.sp, colorScheme.primary, FontWeight.w700),
          textScaleFactor: 1,
        ),
        SizedBox(height: 5.h),
        Text(
          stay.amenities,
          style:
              Fonts.sFProDisplay(15.sp, colorScheme.primary, FontWeight.w400),
          textScaleFactor: 1,
        ),
      ],
    );
  }
}
