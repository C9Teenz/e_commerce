// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_commerce_comic/routers/app_pages.dart';
import 'package:e_commerce_comic/ui/widgets/custombutton.dart';
import 'package:e_commerce_comic/ui/widgets/customcheckout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:e_commerce_comic/models/cartmodel.dart';

import '../utils/themes.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    Key? key,
    required this.datas,
    required this.itemsPrice,
  }) : super(key: key);
  final List<CartModel> datas;
  final int itemsPrice;

  @override
  Widget build(BuildContext context) {
    final List<String> items = ["JNE", "JNT", "Ninja", "Tiki"];
    String? selectedValue;
    Widget header() {
      return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        child: SizedBox(
          child: Row(
            children: [
              IconButton(
                onPressed: () => context.go(Routes.main),
                icon: const Icon(Icons.arrow_back_ios),
                color: kSecondaryColor,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                'Checkout',
                style: primaryTextStyle.copyWith(
                    fontSize: 20, fontWeight: semiBold),
              )
            ],
          ),
        ),
      );
    }

    Widget dropdown() {
      return SizedBox(
        child: DropdownButtonHideUnderline(
            child: DropdownButton2(
          hint: const Text("choose..."),
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {},
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
            ),
            offset: const Offset(-5, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all<double>(6),
              thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.black26,
              ),
              color: Colors.white,
            ),
            elevation: 2,
          ),
        )),
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
                  fontSize: 16, fontWeight: semiBold, color: Colors.black),
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
                              .format(itemsPrice),
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
                              .format(20000),
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
                  child: TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: "Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: kPrimaryColor))),
                  ),
                ),
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
                    itemCount: datas.length,
                    itemBuilder: (context, index) {
                      return CustomCheckout(data: datas[index]);
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
                dropdown(),
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
                        .format(itemsPrice + 20000),
                    style: primaryTextStyle.copyWith(
                        fontSize: 17, fontWeight: semiBold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.4,
              child: CustomButton(
                  title: "Pay Now",
                  onPressed: () {},
                  color: kPrimaryColor,
                  textStyle: titleTextStyle.copyWith(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
