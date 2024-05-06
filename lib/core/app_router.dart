// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smile_care/feautre/common/home/home.dart';
import 'package:smile_care/feautre/common/main/main.dart';
import 'package:smile_care/feautre/feautre.dart';
import 'package:smile_care/feautre/health_record/health_record.dart';
import 'package:smile_care/feautre/profile/profile.dart';

enum Routes {
  root("/"),
  boarding("/feautre/boarding"),

  signIn("/feautre/auth/sign_in"),
  signUp("/feautre/auth/sign_up"),

  main("/feautre/common/main"),

  home("/feautre/common/home"),
  booking_appointment("/feautre/common/booking_appointment"),
  my_appointment("/feautre/common/my_appointment"),
  record_of_visits("/feautre/common/record_of_visits"),
  required_materials("/feautre/common/required_materials"),
  test_results("/feautre/common/test_results"),

  health_record("/feautre/health_record"),
  details_health_record("/feautre/details_health_record"),
  doctors_sessions("/feautre/doctors_sessions"),
  patient_sessions("/feautre/patient_sessions"),
  session_summary("/feautre/session_summary"),

  profile("/feautre/profile"),
  edit_profile("/feautre/edit-profile"),
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
      GoRoute(
        path: Routes.edit_profile.path,
        name: Routes.edit_profile.name,
        builder: (context, state) => EditProfileScreen(),
      ),
      GoRoute(
        path: Routes.details_health_record.path,
        name: Routes.details_health_record.name,
        builder: (context, state) => DetailsHealthRecordScreen(),
      ),
      GoRoute(
        path: Routes.doctors_sessions.path,
        name: Routes.doctors_sessions.name,
        builder: (context, state) => DoctorsSessions(),
      ),
      GoRoute(
        path: Routes.patient_sessions.path,
        name: Routes.patient_sessions.name,
        builder: (context, state) => PatientSessions(),
      ),
      GoRoute(
        path: Routes.session_summary.path,
        name: Routes.session_summary.name,
        builder: (context, state) => SessionSummary(),
      ),
      GoRoute(
        path: Routes.booking_appointment.path,
        name: Routes.booking_appointment.name,
        builder: (context, state) => BookingAppointment(),
      ),
      GoRoute(
        path: Routes.my_appointment.path,
        name: Routes.my_appointment.name,
        builder: (context, state) => MyAppointment(),
      ),
      GoRoute(
        path: Routes.record_of_visits.path,
        name: Routes.record_of_visits.name,
        builder: (context, state) => RecordOfVisits(),
      ),
      GoRoute(
        path: Routes.required_materials.path,
        name: Routes.required_materials.name,
        builder: (context, state) => RequiredMaterials(),
      ),
      GoRoute(
        path: Routes.test_results.path,
        name: Routes.test_results.name,
        builder: (context, state) => TestResults(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainScreen(child: child),
        routes: [
          GoRoute(
            path: Routes.home.path,
            name: Routes.home.name,
            builder: (context, state) => HomeScreen(),
          ),
          GoRoute(
            path: Routes.profile.path,
            name: Routes.profile.name,
            builder: (context, state) => ProfileScreen(),
          ),
          GoRoute(
            path: Routes.health_record.path,
            name: Routes.health_record.name,
            builder: (context, state) => HealthRecordScreen(),
          ),
        ],
      ),
    ],
    initialLocation: Routes.home.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
  );
}
