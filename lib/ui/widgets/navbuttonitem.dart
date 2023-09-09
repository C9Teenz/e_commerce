import 'package:e_commerce_comic/cubit/navbarbutton/navbarbutton_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NavButtonItem extends StatelessWidget {
  final IconData icon;
  final int index;
  final String label;
  const NavButtonItem({
    Key? key,
    required this.icon,
    required this.index,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<NavbarbuttonCubit, int>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(),
            IconButton(
              onPressed: () {
                context.read<NavbarbuttonCubit>().changeIndex(index);
              },
              icon: Icon(
                icon,
                size: 28,
                color: state == index ? Colors.amber[900] : Colors.grey,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: state == index ? Colors.amber[900] : Colors.grey,
              ),
            )
          ],
        );
      },
    );
  }
}