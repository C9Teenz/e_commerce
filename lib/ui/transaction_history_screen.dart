// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:e_commerce_comic/cubit/purchased_order/purchased_order_cubit.dart';
import 'package:e_commerce_comic/cubit/waiting_payment/waiting_payment_cubit.dart';
import 'package:e_commerce_comic/ui/widgets/cardtransaction.dart';
import 'package:e_commerce_comic/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../routers/app_pages.dart';

class TransactionsHistoryScreen extends StatelessWidget {
  const TransactionsHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: kPrimaryColor,
          ),
        ),
        title: Text(
          "Transaction History",
          style: primaryTextStyle.copyWith(fontWeight: semiBold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Purchesed Items",
                    style: primaryTextStyle.copyWith(
                        color: Colors.black, fontWeight: bold, fontSize: 20),
                  ),
                  Expanded(
                    child: SizedBox(
                      child:
                          BlocBuilder<PurchasedOrderCubit, PurchasedOrderState>(
                        builder: (context, state) {
                          return state.when(
                              initial: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                              loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                              loaded: (data) => ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          context.pushNamed(
                                              Routes.detailTransaction,
                                              pathParameters: {
                                                "indexs": "$index"
                                              },
                                              extra: data[index]);
                                        },
                                        child: CardTransaction(
                                          data: data[index],
                                        ),
                                      );
                                    },
                                  ),
                              error: (e) => Center(
                                    child: Text(e),
                                  ));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Waiting Payment Items",
                    style: primaryTextStyle.copyWith(
                        color: Colors.black, fontWeight: bold, fontSize: 20),
                  ),
                  Expanded(
                    child: SizedBox(
                      child:
                          BlocBuilder<WaitingPaymentCubit, WaitingPaymentState>(
                        builder: (context, state) {
                          return state.when(
                            initial: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            loaded: (data) => ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    context.pushNamed(Routes.detailTransaction,
                                        pathParameters: {"indexs": "$index"},
                                        extra: data[index]);
                                  },
                                  child: CardTransaction(
                                    data: data[index],
                                  ),
                                );
                              },
                            ),
                            error: (e) => Center(
                              child: Text(e),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
