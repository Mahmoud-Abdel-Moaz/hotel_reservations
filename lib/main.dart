import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constanse/constanse.dart';
import 'core/local/cache_helper.dart';
import 'core/local/keys.dart';
import 'core/theme/theme.dart';
import 'injection_container.dart' as di;
import 'presentation/bloc/reservation_cubit.dart';
import 'presentation/pages/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await di.init();
  selectedTheme = CacheHelper.getData(key: THEME, defaultValue: selectedTheme);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<ReservationCubit>(),
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          builder: (context, child) =>
              BlocBuilder<ReservationCubit, ReservationState>(
                builder: (context, state) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Hotel Reservations',
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    themeMode: ReservationCubit.get(context).themeMode,
                    home: const HomeScreen(),
                  );
                },
              )),
    );
  }
}
