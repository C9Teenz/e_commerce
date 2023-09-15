// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:e_commerce_comic/cubit/cart/cart_cubit.dart';
import 'package:e_commerce_comic/cubit/counter/counter_cubit.dart';
import 'package:e_commerce_comic/data/localdata.dart';
import 'package:e_commerce_comic/models/cartmodel.dart';
import 'package:e_commerce_comic/models/comic_model.dart';
import 'package:e_commerce_comic/ui/widgets/carosel_detail.dart';
import 'package:e_commerce_comic/ui/widgets/custombutton.dart';
import 'package:e_commerce_comic/utils/constants.dart';

import '../routers/app_pages.dart';
import '../utils/themes.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.data,
  }) : super(key: key);
  final ComicModelDatum data;

  @override
  Widget build(BuildContext context) {
    int qty = 0;

    return Scaffold(
      backgroundColor: kContainerColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            context.read<CounterCubit>().reset();
                            context.pop();
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Map<String, dynamic> file = {
                                    "id": data.id,
                                    "comic_name": data.attributes.comicName,
                                    "image":
                                        "${Constant.baseUrl}${data.attributes.images.data[0].attributes.url}",
                                    "price": int.parse(data.attributes.price),
                                    "qty": qty
                                  };
                                  LocalData.isLogin().then((value) => {
                                        if (value)
                                          {
                                            if (qty == 0)
                                              {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                      "Please add quantity"),
                                                ))
                                              }
                                            else
                                              {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                      "Success add to cart"),
                                                )),
                                                context
                                                    .read<CartCubit>()
                                                    .addData(CartModel.fromJson(
                                                        file))
                                              }
                                          }
                                        else
                                          {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text("Warning"),
                                                  content: const Text(
                                                      "Please login first"),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text("Ok"))
                                                  ],
                                                );
                                              },
                                            )
                                          }
                                      });
                                },
                                icon: const Icon(
                                    Icons.add_shopping_cart_outlined),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    child: CaroselDetail(images: data.attributes.images.data)),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Status",
                    style: secondaryTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    data.attributes.isAvailable ? "Available" : "Out of Stock",
                    style: titleTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                        color: data.attributes.isAvailable
                            ? Colors.green
                            : Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              data.attributes.comicName,
              style: titleTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              data.attributes.author.data.attributes.name,
              style: secondaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Description",
              style: titleTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 18,
              ),
            ),
            Text(
              data.attributes.description,
              style: secondaryTextStyle.copyWith(
                fontWeight: light,
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Genre",
              style: titleTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.attributes.genres.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 16),
                    width: 100,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Text(
                      data.attributes.genres.data[index].attributes.name,
                      style: whiteTextStyle,
                    )),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    NumberFormat.currency(
                            locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                        .format(
                      double.tryParse(data.attributes.price * 1),
                    ),
                    style: titleTextStyle.copyWith(
                        fontWeight: bold, fontSize: 24, color: kPrimaryColor),
                  ),
                  BlocBuilder<CounterCubit, int>(
                    builder: (context, state) {
                      qty = state;
                      return Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  if (state > 0) {
                                    context.read<CounterCubit>().decrement();
                                  }
                                },
                                child: const Text("-")),
                            Text("$state"),
                            TextButton(
                                onPressed: () {
                                  if (state <= 200) {
                                    context.read<CounterCubit>().increment();
                                  }
                                },
                                child: const Text("+"))
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                height: 70,
                width: double.infinity,
                child: CustomButton(
                    title: "Buy Now",
                    onPressed: () {
                      List<CartModel> datas = [
                        CartModel(
                            id: data.id,
                            comicName: data.attributes.comicName,
                            image:
                                "${Constant.baseUrl}${data.attributes.images.data[0].attributes.url}",
                            price: int.parse(data.attributes.price),
                            qty: qty)
                      ];

                      LocalData.isLogin().then(
                        (value) {
                          if (value) {
                            context.pushNamed(Routes.checkout,
                                pathParameters: {
                                  "prices":
                                      "${qty * int.parse(data.attributes.price)}"
                                },
                                extra: datas);
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Warning"),
                                  content: const Text("Please login first"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Ok"))
                                  ],
                                );
                              },
                            );
                          }
                        },
                      );
                    },
                    color: kPrimaryColor,
                    textStyle: titleTextStyle.copyWith(color: Colors.white)),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
