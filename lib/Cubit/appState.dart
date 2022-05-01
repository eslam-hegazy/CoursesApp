// ignore_for_file: file_names

abstract class AppState {}

class AppInitialState extends AppState {}

class ChangeLanguageState extends AppState {}

class ChangeOnBoardingState extends AppState {}

class ChangeThemeState extends AppState {}

class LoadingCourses extends AppState {}

class SuccessfulGetCourses extends AppState {}

class ErrorGetCourses extends AppState {}
