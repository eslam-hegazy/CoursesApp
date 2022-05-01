import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/Screens/Home/MainScreen/MainScreen.dart';
import 'package:flutter_application_1/View/Screens/Home/MenuScreen/MenuScreen.dart';
import 'package:flutter_application_1/presentation/color_manager.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuBackgroundColor: ColorLightManager.lightGrey,
      showShadow: true,
      menuScreen: MenuScreen(),
      mainScreen: MainScreen(),
    );
  }
}
