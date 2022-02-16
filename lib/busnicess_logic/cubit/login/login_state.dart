part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginInitial {}

class LoginSuccessState extends LoginInitial {
  final ResponseData data;

  LoginSuccessState(this.data);
}

class LoginErrorState extends LoginInitial {
  final String error;
  LoginErrorState(this.error);
}

class LoginChavgePassVisiblityState extends LoginState {}

class ValidatePasswordState extends LoginState {
  final bool isValidate;

  ValidatePasswordState({required this.isValidate});
}

class ValidateEmailState extends LoginState {
  final bool isValidate;

  ValidateEmailState({required this.isValidate});
}

class RegisterChavgePassVisiblityState extends LoginState {}
