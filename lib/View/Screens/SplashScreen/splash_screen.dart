import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cubit/appCubit.dart';
import 'package:flutter_application_1/Cubit/appState.dart';
import 'package:flutter_application_1/View/Screens/OnBoarding/onBoarding_Screen.dart';
import 'package:flutter_application_1/language/ar.dart';
import 'package:flutter_application_1/language/en.dart';
import 'package:flutter_application_1/presentation/color_manager.dart';
import 'package:flutter_application_1/presentation/font_manager.dart';
import 'package:flutter_application_1/presentation/navigator_management.dart';
import 'package:flutter_application_1/presentation/size_manager.dart';
import 'package:flutter_application_1/presentation/style_manager.dart';
import 'package:flutter_application_1/presentation/values_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class splash_screen extends StatefulWidget {
  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 8), () {
      // Navigator.push(context, MaterialPageRoute(builder: (_) {
      //   return onBoarding_Screen();
      // }));
      navigatorPushReplacement(context, onBoarding_Screen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var lang = AppCubit.isEnglish;
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CircleAvatar(
                      radius: querySizeHeight(context) * 0.20,
                      child: Lottie.asset('assets/images/SplashScreen.json'),
                      backgroundColor: cubit.isDark
                          ? ColorDarkManager.primaryColor
                          : ColorLightManager.primaryColor,
                    ),
                    Text(
                      lang ? logo_Title1 : logo_Title2,
                      style: getTextStyle(
                        22,
                        FontWeight.bold,
                        lang
                            ? FontManager.boldEnglishFont
                            : FontManager.arabicFont,
                        cubit.isDark == true
                            ? ColorDarkManager.lightColor
                            : ColorLightManager.blackColor,
                        2,
                      ),
                    ),
                  ],
                ),
                CircularProgressIndicator(
                  backgroundColor: ColorLightManager.blackColor,
                  color: ColorLightManager.darkGrey,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
