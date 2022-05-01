import 'package:flutter/material.dart';

dynamic navigatorPush(context, Widget widget) {
  return Navigator.push(context, MaterialPageRoute(builder: (_) {
    return widget;
  }));
}

dynamic navigatorPushReplacement(context, Widget widget) {
  return Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
    return widget;
  }));
}
