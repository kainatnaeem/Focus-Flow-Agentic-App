
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:focus_flow/core/constants/app_routes.dart';
import 'package:focus_flow/core/theme/app_theme.dart';
import 'package:focus_flow/features/sprint/data/services/api_services.dart';

import 'package:focus_flow/features/sprint/presentation/cubit/sprint_cubit.dart';
import 'package:focus_flow/features/sprint/presentation/pages/planner_page.dart';
import 'package:focus_flow/features/sprint/presentation/pages/landing_page.dart';

// Import other Cubits here

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SprintCubit(),
        ),

        // Add other Cubits here
        // BlocProvider(create: (context) => PlannerCubit()),
        // BlocProvider(create: (context) => TimerCubit()),
        // BlocProvider(create: (context) => SettingsCubit()),
      ],
      child: const FocusFlowApp(),
    ),
  );
}

class FocusFlowApp extends StatelessWidget {
  const FocusFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FocusFlow',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.landing,
      routes: {
        AppRoutes.landing: (context) => const LandingPage(),
        AppRoutes.planner: (context) => const PlannerPage(),
      },
    );
  }
}
