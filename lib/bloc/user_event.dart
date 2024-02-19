part of 'user_bloc.dart';

sealed class UserEvent {}
final class UserInitialEVent extends UserEvent{}

final class AuthLoginRequested extends UserEvent{
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});

}
