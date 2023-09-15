// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:e_commerce_comic/cubit/url_payment/url_payment_cubit.dart';
import 'package:e_commerce_comic/ui/widgets/custombutton.dart';
import 'package:e_commerce_comic/ui/widgets/customcheckout.dart';
import 'package:e_commerce_comic/ui/widgets/snapwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../models/response_order_model.dart';
import '../utils/themes.dart';

class DetailPaymentScreen extends StatelessWidget {
  const DetailPaymentScreen({
    Key? key,
    required this.datas,
    required this.index,
  }) : super(key: key);
  final ResponseOrder datas;
  final int index;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        child: SizedBox(
          child: Row(
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_ios),
                color: kSecondaryColor,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                'Detail Transaction',
                style: primaryTextStyle.copyWith(
                    fontSize: 20, fontWeight: semiBold),
              )
            ],
          ),
        ),
      );
    }

    Widget payment() {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment',
              style: primaryTextStyle.copyWith(
                  fontSize: 14, fontWeight: semiBold, color: Colors.black),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.12,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SubTotal',
                          style: secondaryTextStyle.copyWith(fontSize: 14),
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(datas.attributes.totalPrice -
                                  datas.attributes.shippingCost),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discont',
                          style: secondaryTextStyle.copyWith(fontSize: 14),
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(0),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Fee',
                          style: secondaryTextStyle.copyWith(fontSize: 14),
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(datas.attributes.shippingCost),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ))
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                Text(
                  'Address',
                  style: primaryTextStyle.copyWith(
                      color: Colors.black, fontWeight: semiBold),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Text(
                      datas.attributes.destinationAddress,
                      maxLines: 3,
                    )),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Items',
                  style: primaryTextStyle.copyWith(
                      color: Colors.black, fontWeight: semiBold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: datas.attributes.items.length,
                    itemBuilder: (context, index) {
                      return CustomCheckout(
                          data: datas.attributes.items[index]);
                    },
                  ),
                ),
                Text(
                  'Delivery Service',
                  style: primaryTextStyle.copyWith(
                      color: Colors.black, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: Text(datas.attributes.courier),
                ),
                const SizedBox(
                  height: 8,
                ),
                payment(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Payment',
                    style: secondaryTextStyle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 0.1,
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                        .format(datas.attributes.totalPrice),
                    style: primaryTextStyle.copyWith(
                        fontSize: 17, fontWeight: semiBold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.4,
              child: datas.attributes.statusOrder.toLowerCase() == "purchased"
                  ? AbsorbPointer(
                      absorbing: true,
                      child: CustomButton(
                          title: "Continue Payment",
                          onPressed: () {},
                          color: Colors.grey,
                          textStyle:
                              titleTextStyle.copyWith(color: Colors.white)),
                    )
                  : BlocBuilder<UrlPaymentCubit, List<String>>(
                      builder: (context, state) {
                        return CustomButton(
                            title: "Continue Payment",
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SnapWidget(url: state[index]);
                              }));
                            },
                            color: kPrimaryColor,
                            textStyle:
                                titleTextStyle.copyWith(color: Colors.white));
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
