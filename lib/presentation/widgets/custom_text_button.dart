import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/fonts.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const CustomTextButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 18.w),
        decoration: BoxDecoration(color: colorScheme.background),
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
