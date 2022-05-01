import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/CategoryModel.dart';
import 'package:flutter_application_1/presentation/color_manager.dart';
import 'package:flutter_application_1/presentation/font_manager.dart';
import 'package:flutter_application_1/presentation/size_manager.dart';
import 'package:flutter_application_1/presentation/style_manager.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;

  CategoryItem(this.categoryModel);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: querySizeHeight(context) * 0.25,
            width: querySizeWidth(context) * 0.30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(categoryModel.image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: querySizeHeight(context) * 0.25,
            width: querySizeWidth(context) * 0.30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: categoryModel.color.withOpacity(0.8),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: querySizeHeight(context) * 0.25,
            width: querySizeWidth(context) * 0.25,
            child: Text(
              categoryModel.name,
              textAlign: TextAlign.center,
              style: getTextStyle(
                  15,
                  FontWeight.bold,
                  FontManager.regularEnglishFont,
                  ColorLightManager.primaryColor,
                  0),
            ),
          ),
        ],
      ),
    );
  }
}
