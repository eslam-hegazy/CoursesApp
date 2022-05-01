import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cubit/appCubit.dart';
import 'package:flutter_application_1/Cubit/appState.dart';
import 'package:flutter_application_1/View/Screens/Home/HomeScreen.dart';
import 'package:flutter_application_1/View/Widgets/DefaultButton.dart';
import 'package:flutter_application_1/language/ar.dart';
import 'package:flutter_application_1/language/en.dart';
import 'package:flutter_application_1/presentation/color_manager.dart';
import 'package:flutter_application_1/presentation/font_manager.dart';
import 'package:flutter_application_1/presentation/navigator_management.dart';
import 'package:flutter_application_1/presentation/size_manager.dart';
import 'package:flutter_application_1/presentation/style_manager.dart';
import 'package:flutter_application_1/presentation/values_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoarding_Screen extends StatelessWidget {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        bool? lang = AppCubit.isEnglish;
        return Scaffold(
          appBar: AppBar(
            actions: [
              MaterialButton(
                onPressed: () {
                  navigatorPushReplacement(context, HomeScreen());
                },
                child: Text(
                  lang ? skip1 : skip2,
                  style: getTextStyle(
                    18,
                    null,
                    lang ? FontManager.boldEnglishFont : FontManager.arabicFont,
                    Colors.red,
                    0,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: pageController,
                    onPageChanged: (value) {
                      if (value == cubit.onBoardingData.length - 1) {
                        cubit.changeDot(true);
                      } else {
                        cubit.changeDot(false);
                      }
                    },
                    itemCount: 3,
                    itemBuilder: ((context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: querySizeHeight(context) * 0.30,
                            width: querySizeWidth(context),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "${cubit.onBoardingData[index].image}"),
                              ),
                            ),
                          ),
                          SizedBox(height: querySizeHeight(context) * 0.02),
                          Text(
                            cubit.onBoardingData[index].title,
                            textAlign: TextAlign.center,
                            style: getTextStyle(
                              18,
                              FontWeight.bold,
                              lang
                                  ? FontManager.boldEnglishFont
                                  : FontManager.arabicFont,
                              cubit.isDark
                                  ? ColorDarkManager.lightColor
                                  : ColorLightManager.blackColor,
                              0,
                            ),
                          ),
                          SizedBox(height: querySizeHeight(context) * 0.03),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              cubit.onBoardingData[index].description,
                              textAlign: TextAlign.center,
                              style: getTextStyle(
                                16,
                                null,
                                lang
                                    ? FontManager.regularEnglishFont
                                    : FontManager.arabicFont,
                                ColorLightManager.lightGrey,
                                0,
                              ),
                            ),
                          ),
                          SizedBox(height: querySizeHeight(context) * 0.08),
                          SmoothPageIndicator(
                            controller: pageController,
                            count: 3,
                            effect: const ExpandingDotsEffect(
                              dotWidth: 8,
                              dotHeight: 8,
                              expansionFactor: 4,
                              spacing: 5,
                              activeDotColor: Colors.red,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                DefaultButton(
                  cubit.isFinal == true
                      ? lang
                          ? start1
                          : start2
                      : lang
                          ? skip1
                          : skip2,
                  () {
                    if (cubit.isFinal == true) {
                      navigatorPushReplacement(context, HomeScreen());
                    } else {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                ),
                SizedBox(
                  height: querySizeHeight(context) * 0.04,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
