import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../constanse/colors.dart';
import '../../constanse/constanse.dart';
import '../../core/fonts.dart';
import '../../core/local/cache_helper.dart';
import '../../core/local/keys.dart';
import '../widgets/reservations_view.dart';
import '../widgets/static_tickets_view.dart';

showReservationSheet({required BuildContext mainContext}) {
  ColorScheme colorScheme = Theme.of(mainContext).colorScheme;
  double height = MediaQuery.of(mainContext).size.height;
  showMaterialModalBottomSheet(
      context: mainContext,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      backgroundColor: colorScheme.background,
      builder: (context) => Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20..r),
                ),
              ),
            ),
            constraints: BoxConstraints(
              maxHeight: height * .95,
            ),
            child: Column(
              children: [
                Opacity(
                  opacity: 0.80,
                  child: Container(
                    width: double.infinity,
                    height: 30.h,
                    decoration: ShapeDecoration(
                      color: bottomSheetColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20..r),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Opacity(
                        opacity: 0.63,
                        child: Container(
                          width: 53.w,
                          height: 6.h,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Expanded(child: ReservationsView()),
              ],
            ),
          ));
}

showAndroidTicketSheet({required BuildContext mainContext}) {
  ColorScheme colorScheme = Theme.of(mainContext).colorScheme;
  double height = MediaQuery.of(mainContext).size.height;

  showMaterialModalBottomSheet(
      context: mainContext,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      backgroundColor: colorScheme.background,
      builder: (context) => Container(
            constraints: BoxConstraints(
              maxHeight: height * .5,
            ),
            child: Column(
              children: [
                Opacity(
                  opacity: 0.80,
                  child: Container(
                    width: double.infinity,
                    height: 30.h,
                    decoration: ShapeDecoration(
                      color: colorScheme.inversePrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20..r),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Opacity(
                        opacity: 0.63,
                        child: Container(
                          width: 53.w,
                          height: 6.h,
                          decoration: ShapeDecoration(
                            color: colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 66.h),
                    color: colorScheme.background,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Text(
                          'Tickets:',
                          style: Fonts.sFProDisplay(
                              18.sp, colorScheme.primary, FontWeight.w700),
                          textScaleFactor: 1,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const StaticTicketItemView(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
}

showIosTicketSheet({required BuildContext mainContext}) {
  ColorScheme colorScheme = Theme.of(mainContext).colorScheme;
  double height = MediaQuery.of(mainContext).size.height;
  showCupertinoModalBottomSheet(
      // expand: true,
      context: mainContext,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      backgroundColor: colorScheme.background,
      builder: (context) => Container(
            constraints: BoxConstraints(
              maxHeight: height * .5,
            ),
            child: Column(
              children: [
                Opacity(
                  opacity: 0.80,
                  child: Container(
                    width: double.infinity,
                    height: 30.h,
                    decoration: ShapeDecoration(
                      color: colorScheme.inversePrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20..r),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Opacity(
                        opacity: 0.63,
                        child: Container(
                          width: 53.w,
                          height: 6.h,
                          decoration: ShapeDecoration(
                            color: colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 66.h),
                    color: colorScheme.background,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Text(
                          'Tickets:',
                          style: Fonts.sFProDisplay(
                              18.sp, colorScheme.primary, FontWeight.w700),
                          textScaleFactor: 1,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const StaticTicketItemView(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
}

changeTheme() {
  selectedTheme = (selectedTheme == LIGHT_MODE) ? DARK_MODE : LIGHT_MODE;
  CacheHelper.saveData(key: THEME, value: selectedTheme);
}
