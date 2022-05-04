import 'package:appointment_registration_apk/screens/appointment_form.dart';
import 'package:appointment_registration_apk/screens/appointment_list.dart';
import 'package:appointment_registration_apk/screens/login_form.dart';
import 'package:flutter/material.dart';
import 'package:appointment_registration_apk/screens/landing_page.dart';
import 'package:appointment_registration_apk/screens/login_page.dart';

// route names
const String landingScreen = 'landing';
const String loginScreen = 'login';
const String loginFormScreen = 'login form';
const String appointmentFormScreen = 'form';
const String appointmentListScreen = 'list';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case landingScreen:
      return MaterialPageRoute(builder: (context) => const LandingScreen());
    case loginScreen:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case loginFormScreen:
      return MaterialPageRoute(builder: (context) => const LoginForm());
    case appointmentFormScreen:
      return MaterialPageRoute(builder: (context) => const AppointmentForm());
    case appointmentListScreen:
      return MaterialPageRoute(builder: (context) => AppointmentList());
    default:
      throw ('Wrong Path');
  }
}
