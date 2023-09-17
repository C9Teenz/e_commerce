import '../cubit/register/register_cubit.dart';
import 'widgets/custombutton.dart';
import 'widgets/textformglobal.dart';
import 'widgets/textformpassword.dart';
import '../utils/themes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../routers/app_pages.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController? email;
  TextEditingController? password;

  TextEditingController? username;
  final _formKey = GlobalKey<FormState>();
  bool obscureT = true;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email?.dispose();
    password?.dispose();
    username?.dispose();

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
                  "Register Account",
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
                        control: email!,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains("@")) {
                            return "Please make sure use correct format";
                          }
                          return null;
                        },
                        inputType: TextInputType.text,
                        icon: Icons.email,
                        label: "Enter Your Email"),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormGlobal(
                        control: username!,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "UserName is Empty";
                          }
                          return null;
                        },
                        inputType: TextInputType.text,
                        icon: Icons.attach_file_sharp,
                        label: "Enter Your username"),
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
                  text: "Login",
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => context.go(Routes.login))
            ])),
            BlocListener<RegisterCubit, RegisterState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  loaded: (data) {
                    context.go(Routes.login);
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
                    title: "Register",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<RegisterCubit>().register(
                            username: username!.text,
                            email: email!.text,
                            password: password!.text);
                      }
                    },
                    color: kPrimaryColor,
                    textStyle: titleTextStyle.copyWith(color: Colors.white),
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
