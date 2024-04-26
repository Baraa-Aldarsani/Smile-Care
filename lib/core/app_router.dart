import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_care/feautre/feautre.dart';

enum Routes {
  root("/"),
  boarding("/boarding"),
  signIn("/auth/sign_in"),
  signUp("/auth/sign_up"),
  ;

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static late BuildContext context;

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.boarding.path,
        name: Routes.boarding.name,
        builder: (_, __) => const OnBoarding(),
      ),
      GoRoute(
        path: Routes.signIn.path,
        name: Routes.signIn.name,
        builder: (_, __) => SignIn(),
      ),
      GoRoute(
        path: Routes.signUp.path,
        name: Routes.signUp.name,
        builder: (_, __) => SignUp(),
      ),
    ],
    initialLocation: Routes.boarding.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
  );
}
