import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/fonts.dart';
import '../../domain/entities/reservation.dart';
import '../bloc/reservation_cubit.dart';
import 'multi_reservation_item_view.dart';
import 'reservation_view.dart';

class ReservationsView extends StatelessWidget {
  const ReservationsView({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    ReservationCubit.get(context).getReservations();
    List<Reservation>? reservations;
    return BlocConsumer<ReservationCubit, ReservationState>(
      listener: (context, state) {
        if (state is LoadedReservationsState) {
          reservations = state.reservations;
        } else if (state is ErrorReservationsState) {}
      },
      builder: (context, state) {
        return Container(
          color: colorScheme.background,
          child: ConditionalBuilder(
            builder: (context) => ListView(
              padding: EdgeInsets.zero,
              children: [
                Image.asset(
                  'assets/images/hotel_view.png',
                  width: double.infinity,
                  height: 300.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 5.h,
                ),
                ConditionalBuilder(
                    condition: reservations!.isNotEmpty,
                    builder: (_) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.w, vertical: 25.h),
                          child: ConditionalBuilder(
                            condition: reservations!.length > 1,
                            builder: (_) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hotel Check-in',
                                  style: Fonts.sFProDisplay(24.sp,
                                      colorScheme.primary, FontWeight.w700),
                                  textScaleFactor: 1,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'Multiple Reservations',
                                  style: Fonts.sFProDisplay(15.sp,
                                      colorScheme.primary, FontWeight.w400),
                                  textScaleFactor: 1,
                                ),
                                SizedBox(height: 40.h),
                                ListView.separated(
                                  itemBuilder: (ctx, index) =>
                                      MultiReservationItemView(
                                    reservation: reservations![index],
                                    index: index,
                                  ),
                                  separatorBuilder: (ctx, index) => SizedBox(
                                    height: 5.h,
                                  ),
                                  itemCount: reservations!.length,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                ),
                              ],
                            ),
                            fallback: (_) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hotel Check-in',
                                  style: Fonts.sFProDisplay(24.sp,
                                      colorScheme.primary, FontWeight.w700),
                                  textScaleFactor: 1,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'World Cup Match',
                                  style: Fonts.sFProDisplay(15.sp,
                                      colorScheme.primary, FontWeight.w400),
                                  textScaleFactor: 1,
                                ),
                                SizedBox(height: 40.h),
                                ReservationItemView(
                                  reservation: reservations!.first,
                                )
                              ],
                            ),
                          ),
                        ),
                    fallback: (_) => const SizedBox()),
              ],
            ),
            condition: reservations != null,
            fallback: (BuildContext context) => Center(
              child: CircularProgressIndicator(
                color: colorScheme.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
