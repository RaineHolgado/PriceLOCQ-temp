import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pricelocq_temp/api/pricelocq_repo.dart';
import 'package:pricelocq_temp/common/custom_button.dart';
import 'package:pricelocq_temp/model/credential.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
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
              const SizedBox(height: 40),
              CustomTextField(),
              const Spacer(),
              CustomButton(
                onTap: () {},
                label: "Continue",
              ),
            ],
          ),
        ),
        // body: Center(
        //   child: TextButton(
        //     onPressed: () async {
        //       Credential _credential = Credential();
        //       _credential.mobile = "09021234567";
        //       _credential.password = "123456";

        //       ref.read(priceLocqApi).login(credential: _credential);
        //       // print(a);
        //     },
        //     child: const Text("Test"),
        //   ),
        // ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Mobile No.",
          style: TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F4FB),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextFormField(
            initialValue: "09021234567",
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
