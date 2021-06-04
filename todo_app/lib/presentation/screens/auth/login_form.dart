import 'package:todo_app/bloc/login_bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/user_repository.dart';
import 'package:todo_app/style/theme_.dart' as Style;

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;
  LoginForm({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  final UserRepository userRepository;
  _LoginFormState(this.userRepository);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Login failed."),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 80.0),
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    autocorrect: false,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  RaisedButton(
                      color: Style.Colors.mainColor,
                      disabledColor: Style.Colors.mainColor,
                      disabledTextColor: Colors.white,
                      onPressed: _onLoginButtonPressed,
                      child: Text(
                        "LOG IN",
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Style.Colors.mainColor,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
