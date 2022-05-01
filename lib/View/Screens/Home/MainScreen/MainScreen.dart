import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cubit/appCubit.dart';
import 'package:flutter_application_1/Cubit/appState.dart';
import 'package:flutter_application_1/View/Screens/Home/MenuScreen/MenuScreen.dart';
import 'package:flutter_application_1/View/Widgets/CategoryItem.dart';
import 'package:flutter_application_1/View/Widgets/CoursesItem.dart';
import 'package:flutter_application_1/presentation/color_manager.dart';
import 'package:flutter_application_1/presentation/font_manager.dart';
import 'package:flutter_application_1/presentation/image_manager.dart';
import 'package:flutter_application_1/presentation/size_manager.dart';
import 'package:flutter_application_1/presentation/style_manager.dart';
import 'package:flutter_application_1/presentation/values_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(7),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: querySizeHeight(context) * 0.03),
                  Row(
                    children: [
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                            onPressed: () {
                              ZoomDrawer.of(context)!.toggle();
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.black,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: querySizeHeight(context) * 0.04),
                            Text(
                              "Hello",
                              style: getTextStyle(
                                16,
                                FontWeight.bold,
                                FontManager.boldEnglishFont,
                                ColorLightManager.blackColor,
                                2,
                              ),
                            ),
                            SizedBox(height: querySizeHeight(context) * 0.02),
                            Text(
                              "Find Your Free Courses",
                              style: getTextStyle(
                                12,
                                FontWeight.bold,
                                FontManager.regularEnglishFont,
                                ColorLightManager.darkGrey,
                                0,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CircleAvatar(
                          backgroundColor: ColorLightManager.primaryColor,
                          backgroundImage:
                              const AssetImage(ImageManager.personalImage),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: querySizeHeight(context) * 0.03),
                  Text(
                    "Category",
                    style: getTextStyle(
                      18,
                      null,
                      FontManager.regularEnglishFont,
                      ColorLightManager.blackColor,
                      0,
                    ),
                  ),
                  SizedBox(height: querySizeHeight(context) * 0.02),
                  SizedBox(
                    height: querySizeHeight(context) * 0.25,
                    width: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return CategoryItem(cubit.categoryData[index]);
                      },
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.categoryData.length,
                    ),
                  ),
                  Text(
                    "Courses",
                    style: getTextStyle(
                      18,
                      null,
                      FontManager.regularEnglishFont,
                      ColorLightManager.blackColor,
                      0,
                    ),
                  ),
                  SizedBox(height: querySizeHeight(context) * 0.02),
                  state is LoadingCourses
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(
                          width: double.infinity,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return CoursesItem(cubit.coursesData[index]);
                            },
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: cubit.coursesData.length,
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
