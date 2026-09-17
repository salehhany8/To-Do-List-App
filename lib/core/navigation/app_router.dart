import 'package:go_router/go_router.dart';
import 'package:todo_list_app/core/navigation/routes.dart';
import 'package:todo_list_app/core/utils/firebase/cache_helper.dart';
import 'package:todo_list_app/features/home/presentation/tabs_manager.dart';
import 'package:todo_list_app/features/home/signup/signup_page.dart';
import 'package:todo_list_app/features/home/splash/splash_page.dart';
import 'package:todo_list_app/features/home/login/login_page.dart';
import 'package:todo_list_app/features/home/presentation/view/widgets/tabs/home_tab.dart';
import 'package:todo_list_app/features/home/presentation/view/widgets/welcome_page.dart';
import 'package:todo_list_app/features/onBoarding/widget/onboarding.dart';

class AppRouter {
  static List<GoRoute> routes =[
    GoRoute(path: Routes.homePageRoute, builder: (context, state) => const TabsManager()),
    GoRoute(path: Routes.splashPageRoute, builder: (context, state) => const SplashPage()),
    GoRoute(path: Routes.onboardingPageRoute, builder: (context, state) => const Onboarding()),
    GoRoute(path: Routes.welcomePageRoute, builder: (context, state) => const WelcomePage()),
    GoRoute(path: Routes.createAccountRoute, builder: (context, state) => const SignupPage()),
    GoRoute(path: Routes.loginPageRoute, builder: (context, state) => const loginPage()),
  ];
  
  static GoRouter appRouter = GoRouter(routes: routes, initialLocation: Routes.splashPageRoute);
}
