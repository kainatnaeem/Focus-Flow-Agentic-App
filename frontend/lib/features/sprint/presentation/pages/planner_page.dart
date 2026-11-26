
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/primary_button.dart';
import '../cubit/sprint_cubit.dart';
import '../cubit/sprint_states.dart';

class PlannerPage extends StatefulWidget {
  const PlannerPage({super.key});

  @override
  State<PlannerPage> createState() => _PlannerPageState();
}

class _PlannerPageState extends State<PlannerPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _goalController = TextEditingController();

  @override
  void dispose() {
    _goalController.dispose();
    super.dispose();
  }
void _generatePlan() {
  if (_formKey.currentState!.validate()) {
    final goal = _goalController.text.trim();

    final minutes = context.read<SprintCubit>().state.selectedMinutes;

    context.read<SprintCubit>().generatePlan(
      goal: goal,
      minutes: minutes,
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Sprint'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What do you want to achieve?',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Describe your goal and let AI break it into manageable steps.',
                  style: TextStyle(
                    color: AppTheme.mutedTextColor,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 28),

                const Text(
                  'Your goal',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: _goalController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Example: Learn Flutter Cubit...',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your goal';
                    }

                    if (value.trim().length < 5) {
                      return 'Goal must be at least 5 characters';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 28),

                const Text(
                  'Available time',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 14),
BlocConsumer<SprintCubit, SprintState>(
  listener: (context, state) {
    if (state is SprintErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error),
          backgroundColor: Colors.red,
        ),
      );
    }
  },

  builder: (context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Duration selection (always visible)
        Wrap(
          spacing: 10,
          children: [15, 30, 45, 60].map((minutes) {
            return ChoiceChip(
              label: Text('$minutes min'),
              selected: state.selectedMinutes == minutes,
              onSelected: (selected) {
                if (selected) {
                  context
                      .read<SprintCubit>()
                      .updateSelectedMinutes(minutes);
                }
              },
            );
          }).toList(),
        ),

        const SizedBox(height: 20),

        // 2. Loading indicator
        if (state is SprintLoadingState)
          const Center(
            child: CircularProgressIndicator(),
          ),

        // 3. Generated plan
        if (state is SprintSuccessState)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              state.plan,
              style: const TextStyle(
                fontSize: 15,
                height: 1.6,
              ),
            ),
          ),
      ],
    );
  },
),

                const SizedBox(height: 36),

                PrimaryButton(
                  title: 'Generate My Plan',
                  icon: Icons.auto_awesome,
                  isLoading: context.watch<SprintCubit>().state is SprintLoadingState,
                  onPressed: _generatePlan,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
