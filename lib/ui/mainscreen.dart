// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:e_commerce_comic/cubit/navbarbutton/navbarbutton_cubit.dart';
import 'package:e_commerce_comic/ui/cartscreen.dart';
import 'package:e_commerce_comic/ui/homescreen.dart';
import 'package:e_commerce_comic/ui/profilescreen.dart';
import 'package:e_commerce_comic/ui/widgets/navbuttonitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int newCurrentPage) {
      switch (newCurrentPage) {
        case 0:
          return const HomeScreen();
        case 1:
          return const CartScreen();
        case 2:
          return const ProfileScreen();

        default:
          return const HomeScreen();
      }
    }

    Widget customButtonNav() {
      return Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavButtonItem(
              icon: Icons.house,
              index: 0,
              label: "Home",
            ),
            NavButtonItem(
              icon: Icons.shopping_basket,
              index: 1,
              label: "Cart",
            ),
            NavButtonItem(
              icon: Icons.person,
              index: 2,
              label: "Profile",
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: BlocBuilder<NavbarbuttonCubit, int>(
        builder: (context, state) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            width: double.infinity,
            child: buildContent(state),
          );
        },
      ),
      bottomNavigationBar: customButtonNav(),
    );
  }
}
