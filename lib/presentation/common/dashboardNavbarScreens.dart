import 'package:flutter/material.dart';
import '../Screens/dashboard/assignments/assignments.dart';
import '../Screens/dashboard/home/home.dart';
import '../Screens/dashboard/planning/planning.dart';
import '../Screens/dashboard/profile/profile.dart';

final List<Widget> dashboardNavbarScreens = [
  HomeScreen(),
  AssignmentsScreen(),
  PlanningScreen(),
  ProfileScreen(),
];
