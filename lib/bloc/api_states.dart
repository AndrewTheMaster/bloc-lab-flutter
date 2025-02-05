import '../Todo.dart';
abstract class ApiStates {}

class InitialState extends ApiStates {}

class LoadingState extends ApiStates {}

class FailureState extends ApiStates {
  final String error;
  FailureState(this.error);
}

class SuccessTodo extends ApiStates {
  final List<Todo> todos;
  SuccessTodo(this.todos);
}
