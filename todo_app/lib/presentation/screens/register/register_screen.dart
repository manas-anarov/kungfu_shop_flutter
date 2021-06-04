import 'package:todo_app/bloc/auth_bloc/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/register_bloc/register_bloc.dart';
import 'package:todo_app/data/user_repository.dart';
import 'package:todo_app/presentation/screens/register/register_form.dart';
import 'register_form.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepository userRepository;

  RegisterScreen({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return RegisterBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: RegisterForm(
          userRepository: userRepository,
        ),
      ),
    );
  }
}
