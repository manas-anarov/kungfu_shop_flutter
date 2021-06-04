part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterButtonPressed extends RegisterEvent {
  final String username;
  final String email;
  final String password;

  const RegisterButtonPressed({
    @required this.username,
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [username, email, password];

  @override
  String toString() =>
      'RegisterButtonPressed { email: $email, password: $password }';
}
