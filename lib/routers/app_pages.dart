import 'package:e_commerce_comic/models/comic_model.dart';
import 'package:e_commerce_comic/ui/loginscreen.dart';
import 'package:e_commerce_comic/ui/mainscreen.dart';
import 'package:e_commerce_comic/ui/onboarding.dart';
import 'package:e_commerce_comic/ui/registerscreen.dart';
import 'package:e_commerce_comic/ui/splashscreen.dart';
import 'package:go_router/go_router.dart';

import '../ui/detailscreen.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => const OnBoarding(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: Routes.main,
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: Routes.detail,
      builder: (context, state) {
        ComicModelDatum data = state.extra as ComicModelDatum;
        return DetailScreen(
          data: data,
        );
      },
    ),
  ];
}