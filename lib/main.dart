import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/api_bloc.dart';
import 'TodoScreen.dart';

void main() {
  runApp(MyApp());
}

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
