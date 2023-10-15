import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constanse/colors.dart';
import '../../constanse/constanse.dart';
import '../../core/local/cache_helper.dart';
import '../../core/local/keys.dart';
import '../bloc/reservation_cubit.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    selectedTheme =
        CacheHelper.getData(key: THEME, defaultValue: selectedTheme);
    bool isLight = selectedTheme == LIGHT_MODE;
    return GestureDetector(
      onTap: () => ReservationCubit.get(context).changeThemeMode(),
      child: BlocConsumer<ReservationCubit, ReservationState>(
        listener: (context, state) {
          if (state is ChangeThemeModeState) {
            selectedTheme =
                CacheHelper.getData(key: THEME, defaultValue: selectedTheme);
            isLight = selectedTheme == LIGHT_MODE;
          }
        },
        builder: (context, state) {
          return Container(
            width: 74.w,
            height: 34.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: isLight ? toggleBackgroundLight : toggleBackgroundDark,
              border: Border.all(
                  width: 1.r,
                  color: isLight ? toggleBorderLight : toggleBorderDark),
              borderRadius: BorderRadius.circular(26.r),
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: isLight
                    ? [
                        Image.asset(
                          'assets/images/toggle/mone.png',
                          height: 23.h,
                          width: 23.w,
                        ),
                        SizedBox(width: 13.w),
                        Container(
                          width: 24.r,
                          height: 24.r,
                          decoration: BoxDecoration(
                            color:
                                isLight ? toggleBorderLight : toggleBorderDark,
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x23000000),
                                blurRadius: 1,
                                offset: Offset(0, 1),
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 4,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        )
                      ]
                    : [
                        Container(
                          width: 24.r,
                          height: 24.r,
                          decoration: BoxDecoration(
                            color:
                                isLight ? toggleBorderLight : toggleBorderDark,
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x23000000),
                                blurRadius: 1,
                                offset: Offset(0, 1),
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 4,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 13.w),
                        Image.asset(
                          'assets/images/toggle/sun.png',
                          height: 23.h,
                          width: 23.w,
                        ),
                      ],
              ),
            ),
          );
        },
      ),
    );
  }
}
