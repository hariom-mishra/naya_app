import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naya_app/bloc/user_bloc.dart';
import 'package:naya_app/features/auth/widgets/sign_in.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        theme: ThemeData(),
        home: SignIn(),
      ),
    );
  }
}
