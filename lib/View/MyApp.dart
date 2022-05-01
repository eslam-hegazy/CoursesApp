import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cubit/appCubit.dart';
import 'package:flutter_application_1/Cubit/appState.dart';
import 'package:flutter_application_1/View/Screens/SplashScreen/splash_screen.dart';
import 'package:flutter_application_1/presentation/color_manager.dart';
import 'package:flutter_application_1/presentation/theme_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getCourse(),
      child: BlocConsumer<AppCubit, AppState>(
        builder: (context, state) {
          bool lang = AppCubit.isEnglish;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeLight(),
            darkTheme: themeDark(),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
              textDirection: lang ? TextDirection.ltr : TextDirection.rtl,
              child: splash_screen(),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
