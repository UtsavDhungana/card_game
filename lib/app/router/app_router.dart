import 'package:flutter/material.dart';

import '../../core/constants/routes.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/login/presentation/pages/login_screen.dart';
import '../../splash_screen.dart';

class AppRouter {
  MaterialPageRoute onGeneratRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginPageRoute:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case Routes.homePageRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}
