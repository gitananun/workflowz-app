import 'package:flutter/material.dart';
import 'package:workflowz/presentation/screens/dashboard/availability/availability.dart';
import 'package:workflowz/presentation/screens/dashboard/profile/screens/change_password.dart';

import '../../presentation/screens/auth/new_password/new_password.dart';
import '../../presentation/screens/auth/recover_by_email/recover_by_email.dart';
import '../../presentation/screens/auth/sign_in/sign_in.dart';
import '../../presentation/screens/auth/sign_up/sign_up.dart';
import '../../presentation/screens/dashboard/assignments/assignments.dart';
import '../../presentation/screens/dashboard/dashboard.dart';
import '../../presentation/screens/system/custom_splash_screen.dart';
import '../../presentation/screens/welcome/welcome.dart';

final Map<String, Widget> appRoutes = {
  '/': WelcomeScreen(),
  '/loading': CustomSplashScreen(),
  '/sign_in': SignInScreen(),
  '/sign_up': SignUpScreen(),
  '/recover_by_email': RecoverByEmailScreen(),
  '/new_password': NewPasswordScreen(),
  '/dashboard': DashboardScreen(),
  '/assignments': AssignmentsScreen(),
  '/availability': AvailabilityScreen(),
  '/profile/change_password': ChangePasswordScreen()
};
