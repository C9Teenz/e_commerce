import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce_comic/cubit/navbarbutton/navbarbutton_cubit.dart';
import 'package:e_commerce_comic/routers/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class PaymentFailedScreen extends StatefulWidget {
  const PaymentFailedScreen({super.key});

  @override
  State<PaymentFailedScreen> createState() => _PaymentFailedScreenState();
}

class _PaymentFailedScreenState extends State<PaymentFailedScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Pembayaran Failed',
        desc: 'Maaf Pembayaran Anda gagal',
        btnOkOnPress: () {
         context.read<NavbarbuttonCubit>().changeIndex(0);
         context.go(Routes.main);
        },
      ).show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}