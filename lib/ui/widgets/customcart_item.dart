// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:e_commerce_comic/cubit/cart/cart_cubit.dart';
import 'package:e_commerce_comic/models/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../utils/themes.dart';

// ignore: must_be_immutable
class CustomCartItem extends StatefulWidget {
  CustomCartItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.image,
      required this.price,
      required this.quantity,
      this.change = false,
      required this.ontap,
      required this.increment,
      required this.decrement,
      required this.input
      })
      : super(key: key);
  final int id;
  final String title;
  final String image;
  final int price;
  final int quantity;
  final Function() ontap;
  final Function() increment;
  final Function() decrement;
  final CartModel input;

  bool change;

  @override
  State<CustomCartItem> createState() => _CustomCartItemState();
}

class _CustomCartItemState extends State<CustomCartItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.ontap();
 
      },
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (detail) {},
        confirmDismiss: (direction) async {
          bool confirm = false;
          await showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Confirm'),
                content: const SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Are you sure you want to delete this item?'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[600],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("No"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      confirm = true;
                      context.read<CartCubit>().deleteItem(widget.input);
                      context.pop();

                    },
                    child: const Text("Yes"),
                  ),
                ],
              );
            },
          );
          if (confirm) {
            return Future.value(true);
          }
          return Future.value(false);
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
              color: widget.change ? Colors.grey : kContainerColor,
              border: Border.all(color: kContainerColor, width: 2),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: 91,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.image), fit: BoxFit.fill),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8))),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(widget.price),
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 24,
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: widget.decrement,
                                child: Container(
                                  width: 22,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: kContainerColor, width: 1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "-",
                                      style: primaryTextStyle,
                                    ),
                                  ),
                                ),
                              ),
                              Text('${widget.quantity}'),
                              GestureDetector(
                                onTap: widget.increment,
                                child: Container(
                                  width: 22,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: kContainerColor, width: 1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "+",
                                    style: primaryTextStyle,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
