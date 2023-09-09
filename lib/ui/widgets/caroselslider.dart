// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_comic/utils/constants.dart';
import 'package:e_commerce_comic/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/home/home_cubit.dart';

class CaroselSlider extends StatelessWidget {
  const CaroselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController controller = CarouselController();
    return Column(
      children: [
        BlocBuilder<HomeCubit, int>(
          builder: (context, state) {
            return CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                autoPlayCurve: Curves.linear,
                animateToClosest: false,
                height: 160.0,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  context.read<HomeCubit>().changeIndex(index);
                },
              ),
              items: Constant.imagesCarosel.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            );
          },
        ),
        BlocBuilder<HomeCubit, int>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: Constant.imagesCarosel.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => controller.animateToPage(entry.key),
                  child: state == entry.key
                      ? Container(
                          width: 24.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: kPrimaryColor),
                        )
                      : Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                        ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
