// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:e_commerce_comic/cubit/cart/cart_cubit.dart';
import 'package:e_commerce_comic/data/localdata.dart';
import 'package:e_commerce_comic/ui/widgets/custombutton.dart';
import 'package:e_commerce_comic/ui/widgets/customcart_item.dart';
import 'package:e_commerce_comic/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../models/cartmodel.dart';
import '../routers/app_pages.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    login();
    context.read<CartCubit>().getCart();
    super.initState();
  }

  void login() async {
    bool token = await LocalData.isLogin();
    setState(() {
      islogin = token;
    });
  }

  bool change = false;
  bool islogin = false;
  List<CartModel> dataTemporary = [];
  int totalharga = 0;
  void addData(CartModel newData) {
    bool isDuplicate = false;
    int totalTemporary = 0;
    // Periksa apakah data dengan 'value' yang sama sudah ada
    for (var data in dataTemporary) {
      if (data.id == newData.id) {
        isDuplicate = true;
        dataTemporary.removeWhere((element) => element.id == newData.id);
        break; // Hentikan iterasi jika data yang sama ditemukan
      }
    }

    // Jika tidak ada data yang sama, tambahkan newData
    if (!isDuplicate) {
      dataTemporary.add(newData);
      // Tambahkan setState() di sini jika Anda ingin memperbarui tampilan setelah menambahkan data
    }
    for (var total in dataTemporary) {
      totalTemporary += total.price * total.qty;
    }
    setState(() {
      totalharga = totalTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kContainerColor,
        title: Text(
          "Cart",
          style: primaryTextStyle,
        ),
      ),
      body: islogin
          ? BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return state.when(
                  initial: () {
                    return const Center(
                      child: Text("Nodata"),
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  loaded: (model) {
                    if (model.isEmpty) {
                      return const Center(
                        child: Text("No Data"),
                      );
                    }
                    return ListView.builder(
                      itemCount: model.length,
                      itemBuilder: (context, index) {
                        return CustomCartItem(
                          input: model[index],
                          id: model[index].id,
                          title: model[index].comicName,
                          image: model[index].image,
                          price: model[index].price,
                          quantity: model[index].qty,
                          change: dataTemporary.contains(model[index]),
                          ontap: () {
                            addData(model[index]);
                          },
                          increment: () {
                            setState(() {
                              totalharga = 0;
                              dataTemporary = [];
                            });
                            context
                                .read<CartCubit>()
                                .incrementItem(model[index].id);
                          },
                          decrement: () {
                            setState(() {
                              totalharga = 0;
                              dataTemporary = [];
                            });
                            if (model[index].qty > 1) {
                              context
                                  .read<CartCubit>()
                                  .decrementItem(model[index].id);
                            }
                          },
                        );
                      },
                    );
                  },
                  error: () {
                    return const Center(
                      child: Text("Error"),
                    );
                  },
                );
              },
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: 150,
                    child: Column(
                      children: [
                        const Text("Please Login first"),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomButton(
                            title: "Login",
                            onPressed: () {
                              context.go(Routes.login);
                            },
                            color: kPrimaryColor,
                            textStyle: whiteTextStyle)
                      ],
                    ),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(width: 1, color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Price',
                    style: secondaryTextStyle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 0.1,
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                        .format(totalharga),
                    style: primaryTextStyle.copyWith(
                        fontSize: 17, fontWeight: semiBold),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: AbsorbPointer(
                absorbing: totalharga == 0,
                child: CustomButton(
                    title: "Buy",
                    onPressed: () {
                      context.pushNamed(Routes.checkout,
                          pathParameters: {"prices": "$totalharga"},
                          extra: dataTemporary);
                      setState(() {
                        dataTemporary = [];
                      });

                      // Navigator.push(context,

                      //     MaterialPageRoute(builder: (context) {
                      //   return const SnapWidget(
                      //       url:
                      //           "https://app.sandbox.midtrans.com/snap/v3/redirection/61eb9182-122e-4d91-a5b5-902082dd521f");
                      // }));
                    },
                    color: totalharga == 0 ? Colors.grey : kPrimaryColor,
                    textStyle: titleTextStyle.copyWith(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
