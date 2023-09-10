// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_comic/cubit/detailcarosel/detail_cubit.dart';
import 'package:e_commerce_comic/models/comic_model.dart';
import 'package:e_commerce_comic/utils/constants.dart';
import 'package:e_commerce_comic/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaroselDetail extends StatelessWidget {
  const CaroselDetail({Key? key, required this.images}) : super(key: key);

  final List<ImagesDatum> images;

  @override
  Widget build(BuildContext context) {
    CarouselController controller = CarouselController();
    return Column(
      children: [
        BlocBuilder<DetailCubit, int>(
          builder: (context, state) {
            return CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                autoPlayCurve: Curves.linear,
                animateToClosest: false,
                height: MediaQuery.of(context).size.height * 0.3,
                autoPlay: false,
                onPageChanged: (index, reason) {
                  context.read<DetailCubit>().changeIndex(index);
                },
              ),
              items: images.map((image) {
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
                            "${Constant.baseUrl}${image.attributes.url}",
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            );
          },
        ),
        BlocBuilder<DetailCubit, int>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
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
