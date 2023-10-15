import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/fonts.dart';
import '../widgets/custom_border_button.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/theme_toggle.dart';
import 'fun.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 42.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageIcon(
                  const AssetImage('assets/images/theme.png'),
                  size: 26.r,
                  color: colorScheme.primary,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Theme',
                  style: Fonts.sFProDisplay(
                      18.sp, colorScheme.primary, FontWeight.w700),
                  textScaleFactor: 1,
                ),
                const Spacer(),
                const ThemeToggle(),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: CustomButton(
                text: 'Open Reservation',
                onTap: () => showReservationSheet(mainContext: context),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: CustomBorderButton(
                text: 'Show IOS Ticket',
                onTap: () => showIosTicketSheet(mainContext: context),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: CustomTextButton(
                text: 'Show Android Ticket',
                onTap: () => showAndroidTicketSheet(mainContext: context),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
