// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_comic/data/encrypt/encrypt_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:e_commerce_comic/utils/themes.dart';

import '../../models/response_order_model.dart';

class CardTransaction extends StatelessWidget {
  const CardTransaction({
    Key? key,
    required this.data,
  }) : super(key: key);
  final ResponseOrder data;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Icon(
          Icons.shopping_bag_outlined,
          size: 40,
          color: kPrimaryColor,
        ),
        title: Text(
          EncryptData.encryptAES(data.id.toString()),
          style: primaryTextStyle.copyWith(
              color: Colors.black, fontWeight: semiBold),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          NumberFormat.currency(locale: "id", symbol: "IDR", decimalDigits: 0)
              .format(data.attributes.totalPrice),
          style: secondaryTextStyle.copyWith(
              color: Colors.black, fontWeight: light),
        ),
        trailing: data.attributes.statusOrder.toLowerCase() == "purchased"
            ? Text(
                "Purchased",
                style: primaryTextStyle.copyWith(
                    fontWeight: semiBold, color: Colors.green),
              )
            : Text(
                "Waiting Payment!",
                style: primaryTextStyle.copyWith(
                    fontWeight: semiBold, color: Colors.red),
              ),
      ),
    );
  }
}
