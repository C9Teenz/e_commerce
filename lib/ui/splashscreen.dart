import 'dart:async';

import 'package:e_commerce_comic/data/localdata.dart';
import 'package:e_commerce_comic/utils/themes.dart';

import '../routers/app_pages.dart';

import '../utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      LocalData.hasData().then((value) {
        if (value) {
          context.go(Routes.main);
        } else {
          context.go(Routes.onboarding);
        }
      });
    });
    final size = MediaQuery.of(context).size.width * 0.5;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: size,
              width: size,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(Constant.logo))),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            Constant.titleSplash,
            style: titleTextStyle.copyWith(
                fontWeight: semiBold, color: kSecondaryColor, fontSize: 32),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'belum ada ide',
            style: titleTextStyle.copyWith(
                fontWeight: light, color: kSecondaryTwoColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
