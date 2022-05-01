import 'dart:convert';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/Cubit/appState.dart';
import 'package:flutter_application_1/Helper/DioHelper.dart';
import 'package:flutter_application_1/Model/CategoryModel.dart';
import 'package:flutter_application_1/Model/CoursesModel.dart';
import 'package:flutter_application_1/Model/OnBoardingModel.dart';
import 'package:flutter_application_1/language/en.dart';
import 'package:flutter_application_1/presentation/image_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../language/ar.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  /////////////////////////////* language
  static bool isEnglish = true;
  void changeLanguage(bool value) {
    isEnglish = value;
    emit(ChangeLanguageState());
  }

  ///////////////////////////// Theme
  bool isDark = false;
  void changeTheme(bool value) {
    isDark = value;
    emit(ChangeThemeState());
  }

  /////////////////////////////* OnBoarding
  List<OnBoardingModel> onBoardingData = [
    OnBoardingModel(
      image: ImageManager.onBoarding1,
      title: isEnglish ? first_Title_OnBoarding1 : first_Title_OnBoarding2,
      description: isEnglish ? first_des_OnBoarding1 : first_des_OnBoarding2,
    ),
    OnBoardingModel(
      image: ImageManager.onBoarding2,
      title: isEnglish ? Second_Title_OnBoarding1 : Second_Title_OnBoarding2,
      description: isEnglish ? second_des_OnBoarding1 : second_des_OnBoarding2,
    ),
    OnBoardingModel(
      image: ImageManager.onBoarding3,
      title: isEnglish ? third_Title_OnBoarding1 : third_Title_OnBoarding2,
      description: isEnglish ? third_des_OnBoarding1 : third_des_OnBoarding2,
    ),
  ];
  ///////////////////////////* Check Final OnBoarding
  bool isFinal = false;
  void changeDot(bool value) {
    isFinal = value;
    emit(ChangeOnBoardingState());
  }

  //////////////////////////* Get Category
  List<CategoryModel> categoryData = [
    CategoryModel(
        ImageManager.developmentImage, "Development", const Color(0xff99CAE1)),
    CategoryModel(
        ImageManager.networkingImage, "Networking", const Color(0xffE19999)),
    CategoryModel(ImageManager.webImage, "Web", const Color(0xff9EE199)),
    CategoryModel(ImageManager.officeProductivityImage, "Office-Productivity",
        const Color(0xff99CAE1)),
    CategoryModel(ImageManager.personalDevelopmentImage, "Personal-Development",
        const Color(0xffE19999)),
    CategoryModel(ImageManager.designImage, "Design", const Color(0xff9EE199)),
    CategoryModel(
        ImageManager.marketingImage, "Marketing", const Color(0xffE19999)),
    CategoryModel(
        ImageManager.languageImage, "Language", const Color(0xff99CAE1)),
    CategoryModel(
        ImageManager.testPrepImage, "Test-Prep", const Color(0xff9EE199)),
  ];
  /////////////////////////////////* get Courses

  List<CoursesModel> coursesData = [];
  Future<void> getCourse() async {
    emit(LoadingCourses());
    var url = 'https://sumanjay.vercel.app/udemy';
    var response = await http
        .get(Uri.parse(url), headers: {'Access-Control-Allow-Origin': '*'});
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      emit(SuccessfulGetCourses());
      jsonData.forEach((element) {
        CoursesModel courseModel = CoursesModel(
          description: element["description"],
          image: element['image'],
          link: element['link'],
          title: element['title'],
        );
        coursesData.add(courseModel);
        print(courseModel.image);
      });
    } else {
      emit(ErrorGetCourses());
      print(response.statusCode);
    }
  }
}
