import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../Todo.dart';
import 'api_events.dart';
import 'api_states.dart';

class ApiBloc extends Bloc<ApiEvents, ApiStates> {
  ApiBloc() : super(InitialState()) {
    on<GetToDoEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final todos = await getTodosApi();
        emit(SuccessTodo(todos));
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    });
  }

  Future<List<Todo>> getTodosApi() async {
    await Future.delayed(Duration(seconds: 3));
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception("Error fetching Todos");
    }
  }
}