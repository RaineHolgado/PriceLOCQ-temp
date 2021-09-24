import 'package:auto_route/auto_route.dart';
import 'package:pricelocq_temp/screens/login/login_view.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    AutoRoute(page: LoginView, initial: true),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $AppRouter {}
