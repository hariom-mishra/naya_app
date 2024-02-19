part of 'user_bloc.dart';


sealed class UserState {}

final class UserInitial extends UserState {}

final class ActiveState extends UserState{}

final class AuthSuccess extends ActiveState{
  // final String uid;

  // AuthSuccess({required this.uid});
}

final class AuthFailure extends ActiveState{
  final String errorMessage;

  AuthFailure({required this.errorMessage});

}

final class AuthLoading extends UserState{
  
}
