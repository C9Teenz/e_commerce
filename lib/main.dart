import 'package:e_commerce_comic/cubit/cart/cart_cubit.dart';
import 'package:e_commerce_comic/cubit/counter/counter_cubit.dart';
import 'package:e_commerce_comic/cubit/detailcarosel/detail_cubit.dart';
import 'package:e_commerce_comic/cubit/filtergenre/filtergenre_cubit.dart';
import 'package:e_commerce_comic/cubit/getcomic/getcomic_cubit.dart';
import 'package:e_commerce_comic/cubit/home/home_cubit.dart';
import 'package:e_commerce_comic/cubit/navbarbutton/navbarbutton_cubit.dart';
import 'package:e_commerce_comic/cubit/profile/profile_cubit.dart';
import 'package:e_commerce_comic/cubit/url_payment/url_payment_cubit.dart';
import 'package:e_commerce_comic/data/authdata.dart';
import 'package:e_commerce_comic/data/remotedatacomic.dart';
import 'package:e_commerce_comic/routers/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'cubit/login/login_cubit.dart';
import 'cubit/onboarding/onboarding_cubit.dart';
import 'cubit/order/order_cubit.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingCubit>(
          create: (context) => OnboardingCubit(),
        ),
        BlocProvider<NavbarbuttonCubit>(
          create: (context) => NavbarbuttonCubit(),
        ),
        BlocProvider<FiltergenreCubit>(
          create: (context) => FiltergenreCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider<GetcomicCubit>(
          create: (context) => GetcomicCubit(RemoteData())..get(),
        ),
        BlocProvider<DetailCubit>(
          create: (context) => DetailCubit(),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
        ),
        BlocProvider<UrlPaymentCubit>(
          create: (context) => UrlPaymentCubit(),
        ),
        BlocProvider<OrderCubit>(
          create: (context) => OrderCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(AuthData()),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(AuthData())..get(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData().copyWith(
          colorScheme:
              ThemeData().colorScheme.copyWith(primary: Colors.amber[900]),
        ),
        title: Constant.titleApp,
        debugShowCheckedModeBanner: false,
        routerConfig:
            GoRouter(routes: AppPages.routes, initialLocation: Routes.main),
      ),
    );
  }
}
