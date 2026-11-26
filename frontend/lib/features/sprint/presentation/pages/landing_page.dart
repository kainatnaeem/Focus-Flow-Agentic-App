
import 'package:flutter/material.dart';
import 'package:focus_flow/core/constants/app_routes.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/primary_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App branding
              Row(
                children: [
                  const Icon(
                    Icons.auto_awesome,
                    color: AppTheme.primaryColor,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'FocusFlow',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),

              const Spacer(),

              // Hero section
              const Center(
                child: Icon(
                  Icons.psychology_alt_rounded,
                  size: 120,
                  color: AppTheme.primaryColor,
                ),
              ),

              const SizedBox(height: 40),

              Text(
                'Turn your goals into action.',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Tell FocusFlow what you want to achieve. '
                'Your AI assistant will break it into '
                'clear, manageable steps.',
                style: TextStyle(
                  color: AppTheme.mutedTextColor,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),

              const Spacer(),

              // Navigation will be connected later
              PrimaryButton(
                title: 'Get Started',
                icon: Icons.arrow_forward_rounded,
                onPressed: () {Navigator.pushNamed(context, AppRoutes.planner);},
              ),

              const SizedBox(height: 20),

              const Center(
                child: Text(
                  'Plan smarter. Focus better. Achieve more.',
                  style: TextStyle(
                    color: AppTheme.secondaryColor,
                    fontSize: 12,
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
