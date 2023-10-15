import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/fonts.dart';

class CustomBorderButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const CustomBorderButton(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 18.w),
        decoration: BoxDecoration(
            color: colorScheme.background,
            border: Border.all(width: 1, color: colorScheme.secondary)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style:
              Fonts.sFProDisplay(16.sp, colorScheme.secondary, FontWeight.w700),
          textScaleFactor: 1,
        ),
      ),
    );
  }
}

/*Container(
    width: 286,
    height: 51,
    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 18),
    decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFF0E1A2D)),
        ),
    ),
    child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Text(
                'Show IOS Ticket ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF0E1A2D),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                    height: 0.09,
                ),
            ),
        ],
    ),
)*/
