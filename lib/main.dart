import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Helper/DioHelper.dart';

import 'BlocObserver.dart';
import 'View/MyApp.dart';

void main() {
  DioHelper.init();
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
