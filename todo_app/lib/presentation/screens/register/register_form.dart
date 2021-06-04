// import 'package:todo_app/bloc/login_bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/register_bloc/register_bloc.dart';
import 'package:todo_app/data/user_repository.dart';
import 'package:todo_app/style/theme_.dart' as Style;

class RegisterForm extends StatefulWidget {
  final UserRepository userRepository;
  RegisterForm({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState(userRepository);
}

class _RegisterFormState extends State<RegisterForm> {
  final UserRepository userRepository;
  _RegisterFormState(this.userRepository);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onRegisterButtonPressed() {
      BlocProvider.of<RegisterBloc>(context).add(
        RegisterButtonPressed(
          email: _usernameController.text,
          password: _passwordController.text,
          username: _passwordController.text,
        ),
      );
    }

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Login failed."),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
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
                    // keyboardType: TextInputType.number,
                    autocorrect: false,
                    decoration: const InputDecoration(labelText: "username"),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    autocorrect: false,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "password"),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    autocorrect: false,
                    // obscureText: true,
                    decoration: const InputDecoration(labelText: "email"),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  RaisedButton(
                      color: Style.Colors.mainColor,
                      disabledColor: Style.Colors.mainColor,
                      disabledTextColor: Colors.white,
                      onPressed: _onRegisterButtonPressed,
                      child: Text(
                        "REGISTER",
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
