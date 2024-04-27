// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_care/feautre/common/home/home.dart';
import 'package:smile_care/feautre/common/main/main.dart';
import 'package:smile_care/feautre/feautre.dart';
import 'package:smile_care/feautre/health_record/health_record.dart';
import 'package:smile_care/feautre/profile/prodile.dart';

enum Routes {
  root("/"),
  boarding("/feautre/boarding"),

  signIn("/feautre/auth/sign_in"),
  signUp("/feautre/auth/sign_up"),

  main("/feautre/common/main"),

  home("/feautre/common/home"),
  health_record("/feautre/health_record"),
  profile("/feautre/profile"),
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
      ShellRoute(
        builder: (context, state, child) => MainScreen(child: child),
        routes: [
          GoRoute(
            path: Routes.home.path,
            name: Routes.home.name,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: Routes.profile.path,
            name: Routes.profile.name,
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: Routes.health_record.path,
            name: Routes.health_record.name,
            builder: (context, state) => const HealthRecordScreen(),
          ),
        ],
      ),
    ],
    initialLocation: Routes.boarding.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
  );
}
