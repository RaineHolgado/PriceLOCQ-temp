import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pricelocq_temp/app/router.gr.dart';
import 'package:pricelocq_temp/helpers/constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF743BBC),
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
    final _appRouter = AppRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'PriceLOCQ-temp',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: primaryAppColor,
        platform: Theme.of(context).platform,
      ),
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
