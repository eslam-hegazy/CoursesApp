import 'package:flutter/material.dart';

import '../../presentation/color_manager.dart';
import '../../presentation/font_manager.dart';
import '../../presentation/size_manager.dart';
import '../../presentation/style_manager.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function press;

  DefaultButton(this.text, this.press);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => press(),
      child: Container(
        height: querySizeHeight(context) * 0.08,
        width: querySizeWidth(context) * 0.7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: getTextStyle(16, null, FontManager.regularEnglishFont,
              ColorLightManager.primaryColor, 0),
        ),
      ),
    );
  }
}
