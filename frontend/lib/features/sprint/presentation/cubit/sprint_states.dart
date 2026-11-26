abstract class SprintState {   
  final int selectedMinutes;
  SprintState({this.selectedMinutes = 30});
}
class SprintInitialState extends SprintState {
}
/*
we have to pass the value of minutes to parent class using super! 
so the parent can initilizes minutes to each child minutes. 
*/
class SprintLoadingState extends SprintState {
  SprintLoadingState({required super.selectedMinutes});
}
class SprintSelectedMin extends SprintState {
 SprintSelectedMin({required super.selectedMinutes});
}
class SprintErrorState extends SprintState {
  String error;
  SprintErrorState({required this.error, super.selectedMinutes});
}
class SprintSuccessState extends SprintState {
  final String plan;
  SprintSuccessState({required this.plan, super.selectedMinutes});
}
