// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/themes.dart';

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(Constant.backgroundImage))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size,
              height: size,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(Constant.savemoney))),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Cheapest',
              style: titleTextStyle.copyWith(
                  fontWeight: semiBold, color: kSecondaryColor, fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
