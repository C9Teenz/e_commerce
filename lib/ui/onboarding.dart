// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:e_commerce_comic/cubit/onboarding/onboarding_cubit.dart';
import 'package:e_commerce_comic/data/localdata.dart';
import 'package:e_commerce_comic/routers/app_pages.dart';
import 'package:e_commerce_comic/ui/onboardingone.dart';
import 'package:e_commerce_comic/ui/onboardingthree.dart';
import 'package:e_commerce_comic/ui/onboardingtwo.dart';
import 'package:e_commerce_comic/ui/widgets/custombutton.dart';
import 'package:e_commerce_comic/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController pageIndex = PageController();
  @override
  Widget build(BuildContext context) {
    Widget customOnboarding() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(
                    title: 'login',
                    onPressed: () async {
                      await LocalData.savestate("login page")
                          .then((value) => context.go(Routes.login));
                    },
                    color: kPrimaryColor,
                    textStyle: whiteTextStyle),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 5,
                  width: 53,
                  child: BlocBuilder<OnboardingCubit, int>(
                    builder: (context, state) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          if (state == index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 8),
                              height: 8,
                              width: 16,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.red),
                            );
                          }
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.amber),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    LocalData.savestate("main")
                        .then((value) => context.go(Routes.main));
                  },
                  child: Text(
                    'Skip',
                    style: primaryTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: (value) {
            setState(() {});

            context.read<OnboardingCubit>().newPage(value);
          },
          children: const [OnBoardingOne(), OnBoardingTwo(), OnBoardingThree()],
        ),
        customOnboarding()
      ],
    ));
  }
}
