import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:todo_list_app/core/style/color_manager.dart';
import 'package:todo_list_app/core/utils/firebase/cache_helper.dart';
import 'package:todo_list_app/features/home/myapp.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: ColorManager.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: ColorManager.black,
      systemNavigationBarIconBrightness: Brightness.light
    )
  );
  runApp(MyApp());
}
