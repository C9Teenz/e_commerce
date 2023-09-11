import 'package:e_commerce_comic/cubit/login/login_cubit.dart';
import 'package:e_commerce_comic/cubit/navbarbutton/navbarbutton_cubit.dart';
import 'package:e_commerce_comic/ui/widgets/custombutton.dart';
import 'package:e_commerce_comic/ui/widgets/textformglobal.dart';
import 'package:e_commerce_comic/ui/widgets/textformpassword.dart';
import 'package:e_commerce_comic/utils/themes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import '../routers/app_pages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? identity;
  TextEditingController? password;
  final _formKey = GlobalKey<FormState>();
  bool obscureT = true;

  @override
  void initState() {
    identity = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    identity?.dispose();
    password?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Login Account",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormGlobal(
                        control: identity!,
                        validator: (value) {
                          if (!value!.contains("@")) {
                            return "Please enter your Email correctly";
                          }
                          return null;
                        },
                        inputType: TextInputType.text,
                        icon: Icons.person,
                        label: "Enter Your Email"),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormPassword(
                        control: password!,
                        obscure: obscureT,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 5) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        onTap: () {
                          setState(() {
                            obscureT = !obscureT;
                          });
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
                text: TextSpan(text: "Haven't an account? ", children: [
              TextSpan(
                  text: "Register",
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => context.go(Routes.register))
            ])),
            BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  loaded: (data) {
                    context.read<NavbarbuttonCubit>().changeIndex(0);
                    context.go(Routes.main);
                  },
                  error: (error) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(error),
                          content: Text(error),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("OK"),
                            )
                          ],
                        );
                      },
                    );
                  },
                );
              },
              child: Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: CustomButton(
                        title: "Login",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                                email: identity!.text, pass: password!.text);
                          }
                        },
                        color: kPrimaryColor,
                        textStyle:
                            titleTextStyle.copyWith(color: Colors.white))),
              )),
            )
          ],
        ),
      ),
    );
  }
}
