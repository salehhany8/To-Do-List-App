import 'package:flutter/widgets.dart';

class Constants {
  static const double appBarHeight = 90;
  static Size getAppBarSize (BuildContext context) =>
  Size(.infinity, 70);
  static const String firebaseTasksCollection = 'tasks';
  static const kUserToken ='kUserToken';
}