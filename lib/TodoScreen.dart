import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Todo.dart';
import 'bloc/api_bloc.dart';
import 'bloc/api_events.dart';
import 'bloc/api_states.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrangeAccent,
        ),
      ),
      home: BlocProvider(
        create: (_) => ApiBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users List")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ApiBloc>().add(GetToDoEvent());
        },
        child: Icon(Icons.person_add),
      ),
      body: buildBloc(),
    );
  }

  Widget buildBloc() {
    return BlocBuilder<ApiBloc, ApiStates>(
      builder: (context, state) {
        if (state is InitialState) {
          return buildInitialView();
        } else if (state is LoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SuccessTodo) {
          return buildUserList(state.todos);
        } else if (state is FailureState) {
          return Center(child: Text("Error: ${state.error}"));
        }
        return Container();
      },
    );
  }

  Center buildInitialView() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<ApiBloc>().add(GetToDoEvent());
        },
        child: Text("Get TODO".toUpperCase()),
      ),
    );
  }

  Widget buildUserList(List<Todo> todo) {
    return ListView.builder(
      itemCount: todo.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(todo[index].title),
        leading: Icon(
          todo[index].completed ? Icons.check : Icons.check_box_outline_blank,
        ),
        tileColor: todo[index].completed ? Colors.green : Colors.white,
      ),
    );
  }
}
