import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 18.w),
        decoration: BoxDecoration(color: colorScheme.secondary),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style:
              Fonts.sFProDisplay(16.sp, colorScheme.tertiary, FontWeight.w700),
          textScaleFactor: 1,
        ),
      ),
    );
  }
}
