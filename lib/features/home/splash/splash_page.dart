import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list_app/core/navigation/routes.dart';
import 'package:todo_list_app/core/style/assets_manager.dart';
import 'package:todo_list_app/core/style/color_manager.dart';
import 'package:todo_list_app/core/style/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/core/utils/firebase/cache_helper.dart';

class SplashPage extends StatefulWidget {
  const new({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static CacheHelper cacheHelper = CacheHelper();
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (!mounted) return;
        context.go(
          cacheHelper.isLoggedin() ?  Routes.homePageRoute : Routes.onboardingPageRoute
          );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.splashPageColor,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SvgPicture.asset(
              AssetsManager.splashLogo,
              //colorFilter: ColorFilter.mode(ColorManager.white, BlendMode.srcIn),
            ),
            Text("TodyApp",style : TextStyles.splashText),
            Text("The best to do list application for you", style :TextStyles.splashTextS)
          ],
        ),
      ),
    );
    
  }

}
