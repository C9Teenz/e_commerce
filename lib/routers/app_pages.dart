import 'package:e_commerce_comic/models/cartmodel.dart';
import 'package:e_commerce_comic/models/comic_model.dart';
import 'package:e_commerce_comic/ui/loginscreen.dart';
import 'package:e_commerce_comic/ui/mainscreen.dart';
import 'package:e_commerce_comic/ui/onboarding.dart';
import 'package:e_commerce_comic/ui/registerscreen.dart';
import 'package:e_commerce_comic/ui/splashscreen.dart';
import 'package:e_commerce_comic/ui/transaction_history_screen.dart';
import 'package:go_router/go_router.dart';

import '../models/response_order_model.dart';
import '../ui/checkoutscreen.dart';
import '../ui/detail_payment_screen.dart';
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
      path: Routes.transaction,
      builder: (context, state) => const TransactionsHistoryScreen(),
    ),
    GoRoute(
      path: "${Routes.checkout}/:prices",
      name: Routes.checkout,
      builder: (context, state) {
        List<CartModel> data = state.extra as List<CartModel>;
        return CheckoutScreen(
          datas: data,
          itemsPrice: int.parse(state.pathParameters["prices"]!),
        );
      },
    ),
    GoRoute(
      path: "${Routes.detailTransaction}/:indexs",
      name: Routes.detailTransaction,
      builder: (context, state) {
        ResponseOrder data = state.extra as ResponseOrder;
        return DetailPaymentScreen(
          datas: data,
          index: int.parse(state.pathParameters["indexs"]!),
        );
      },
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
