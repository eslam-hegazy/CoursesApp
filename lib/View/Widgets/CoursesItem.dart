import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/CoursesModel.dart';
import 'package:flutter_application_1/View/Screens/Home/WebViewScreen.dart/WebViewScreen.dart';
import 'package:flutter_application_1/presentation/navigator_management.dart';
import 'package:flutter_application_1/presentation/size_manager.dart';

import 'package:share_plus/share_plus.dart';

import '../../presentation/color_manager.dart';
import '../../presentation/font_manager.dart';
import '../../presentation/image_manager.dart';
import '../../presentation/style_manager.dart';

class CoursesItem extends StatelessWidget {
  final CoursesModel coursesModel;

  CoursesItem(this.coursesModel);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigatorPush(context, WebViewScreen(coursesModel.link));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: querySizeHeight(context) * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage("${coursesModel.image}"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: querySizeHeight(context) * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorLightManager.grey.withOpacity(0.5),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: ColorLightManager.primaryColor,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: querySizeHeight(context) * 0.25,
              width: querySizeWidth(context) * 0.75,
              padding: const EdgeInsets.all(12),
              child: Text(
                coursesModel.title.replaceAll("[100% OFF]", ""),
                textAlign: TextAlign.left,
                style: getTextStyle(
                    15,
                    FontWeight.bold,
                    FontManager.regularEnglishFont,
                    ColorLightManager.primaryColor,
                    0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9),
              child: Row(
                children: [
                  Icon(
                    Icons.star_border_outlined,
                    color: ColorLightManager.primaryColor,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Free",
                    style: getTextStyle(
                      15,
                      FontWeight.bold,
                      FontManager.boldEnglishFont,
                      ColorLightManager.primaryColor,
                      0,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: IconButton(
                onPressed: () async {
                  await Share.share(coursesModel.link);
                },
                icon: Icon(
                  Icons.share,
                  color: ColorLightManager.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
