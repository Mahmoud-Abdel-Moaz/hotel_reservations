import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/fonts.dart';
import '../../domain/entities/guest.dart';

class GuestItemView extends StatelessWidget {
  final Guest guest;

  const GuestItemView({super.key, required this.guest});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 30.r,
          height: 30.r,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(guest.avatar),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 6.w,
        ),
        Text('${guest.firstName} ${guest.lastName}',
            style: Fonts.sFProDisplay(
                15.sp, colorScheme.surfaceVariant, FontWeight.w400),
            textScaleFactor: 1)
      ],
    );
  }
}
