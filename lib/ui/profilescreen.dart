// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:e_commerce_comic/cubit/profile/profile_cubit.dart';
import 'package:e_commerce_comic/cubit/purchased_order/purchased_order_cubit.dart';
import 'package:e_commerce_comic/cubit/waiting_payment/waiting_payment_cubit.dart';
import 'package:e_commerce_comic/data/localdata.dart';
import 'package:e_commerce_comic/routers/app_pages.dart';
import 'package:e_commerce_comic/ui/widgets/custombutton.dart';
import 'package:e_commerce_comic/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () {},
              loaded: (user) {},
              error: (error) async {
                await LocalData.deleteToken();
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => Column(
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
                              onPressed: () async {
                                await LocalData.getToken();
                                // context.go(Routes.login);
                              },
                              color: kPrimaryColor,
                              textStyle: whiteTextStyle)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (user) {
                return Container(
                  padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Center(
                        child: CircleAvatar(
                          radius: 80.0,
                          child: Icon(
                            Icons.person,
                            size: 70,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        user.username,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        user.email,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<PurchasedOrderCubit>().get();
                          context.read<WaitingPaymentCubit>().get();
                          context.push(Routes.transaction);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: const Row(
                            children: [
                              Icon(Icons.history),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                "Transaction Histories",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomButton(
                              title: "Logout",
                              onPressed: () async {
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
                                            Text(
                                                'Are you sure you want to log out?'),
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
                                            LocalData.deleteToken().then(
                                                (value) =>
                                                    context.go(Routes.login));
                                          },
                                          child: const Text("Yes"),
                                        ),
                                      ],
                                    );
                                  },
                                );

                                if (confirm) {}
                              },
                              color: Colors.red,
                              textStyle: whiteTextStyle),
                        ),
                      )
                    ],
                  ),
                );
              },
              error: (error) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: 150,
                      child: Column(
                        children: [
                          const Text("Please login first"),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomButton(
                              title: "Login",
                              onPressed: () async {
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
            );
          },
        ),
      ),
    );
  }
}
