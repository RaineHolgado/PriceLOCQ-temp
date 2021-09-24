import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pricelocq_temp/common/custom_button.dart';
import 'package:pricelocq_temp/common/custom_textField.dart';
import 'package:pricelocq_temp/screens/login/login_statecontroller.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController _mobileNumController =
      TextEditingController(text: "09021234567");
  final TextEditingController _passwordController =
      TextEditingController(text: "123456");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7438BB),
                ),
              ),
              const SizedBox(height: 50),
              CustomTextField(
                controller: _mobileNumController,
                hintText: "09123456789",
                label: "Mobile No.",
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                ],
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: _passwordController,
                hintText: "P*ssw*rd",
                label: "Password",
                obscureText: true,
                keyboardType: TextInputType.text,
              ),
              const Spacer(),
              Consumer(
                builder: (context, ref, _) {
                  final state = ref.watch(loginStateController);
                  if (state == Status.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    children: [
                      CustomButton(
                        onTap: () async {
                          if (_mobileNumController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty) {
                            ref.read(loginStateController.notifier).login(
                                  context: context,
                                  mobile: _mobileNumController.text,
                                  password: _passwordController.text,
                                );
                          }
                        },
                        label: "Continue",
                      ),
                      if (state == Status.error) ...[
                        const SizedBox(height: 10),
                        Text(
                          "${ref.read(loginStateController.notifier).errorMessage}",
                          style: const TextStyle(color: Colors.red),
                        ),
                      ]
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
