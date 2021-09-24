import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pricelocq_temp/helpers/constants.dart';
import 'package:pricelocq_temp/screens/login/login_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF000000),
      systemNavigationBarColor: Color(0xFF743BBC),
    ),
  );
  runApp(
    const ProviderScope(
      child: PriceLOCQTemp(),
    ),
  );
}

class PriceLOCQTemp extends StatelessWidget {
  const PriceLOCQTemp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PriceLOCQ-temp',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: primaryAppColor,
        platform: Theme.of(context).platform,
      ),
      home: LoginView(),
    );
  }
}
