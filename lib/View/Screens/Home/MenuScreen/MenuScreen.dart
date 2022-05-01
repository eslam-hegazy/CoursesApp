import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/font_manager.dart';
import 'package:flutter_application_1/presentation/image_manager.dart';
import 'package:flutter_application_1/presentation/size_manager.dart';
import 'package:flutter_application_1/presentation/style_manager.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../../presentation/color_manager.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLightManager.lightGrey,
      body: Padding(
        padding: const EdgeInsets.only(left: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(ImageManager.personalImage),
            ),
            const SizedBox(height: 6),
            Text(
              "Eslam Hegazy",
              style: getTextStyle(
                18,
                FontWeight.bold,
                FontManager.boldEnglishFont,
                ColorLightManager.primaryColor,
                0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                "eslamhegazy968@gmail.com",
                style: getTextStyle(
                  12,
                  FontWeight.bold,
                  FontManager.regularEnglishFont,
                  ColorLightManager.darkGrey,
                  0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                "01274996453",
                style: getTextStyle(
                  12,
                  FontWeight.bold,
                  FontManager.regularEnglishFont,
                  ColorLightManager.blackColor,
                  0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
