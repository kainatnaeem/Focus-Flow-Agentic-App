
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/api_services.dart';
import 'sprint_states.dart';

class SprintCubit extends Cubit<SprintState> {
 final ApiService _apiService = ApiService();

  SprintCubit() : super(SprintInitialState());

  // Update selected sprint duration
  void updateSelectedMinutes(int minutes) {
    emit(SprintSelectedMin(selectedMinutes: minutes));
  }

  // Generate sprint plan using OpenAI API
  Future<void> generatePlan({
    required String goal,
    required int minutes,
  }) async {
    emit(SprintLoadingState(selectedMinutes: minutes));

    try {
      final plan = await _apiService.generatePlan(
        goal: goal,
        minutes: minutes,
      );

      emit(
        SprintSuccessState(
          plan: plan,
          selectedMinutes: minutes,
        ),
      );
    } catch (e) {
      emit(
        SprintErrorState(
          error: e.toString(),
          selectedMinutes: minutes,
        ),
      );
    }
  }
}
