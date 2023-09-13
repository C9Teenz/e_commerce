// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/cartmodel.dart';
import '../../utils/themes.dart';

class CustomCheckout extends StatelessWidget {

  const CustomCheckout({
    Key? key,
    required this.data,
  }) : super(key: key);
final CartModel data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12),
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          border: Border.all(color: kContainerColor, width: 4),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 61,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(data.image), fit: BoxFit.fill),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8))),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.58,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data.comicName,
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                          .format(data.price),
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    )
                  ],
                ),
              ),
              Text(
                '${data.qty}X',
                style: italicTextStyle.copyWith(fontSize: 16),
              )
            ],
          )
        ],
      ),
    );
  }
}
