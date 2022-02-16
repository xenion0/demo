part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final ResponseData data;

  RegisterSuccessState(this.data);
}

class RegisterErrorState extends RegisterState {
  final String error;
  RegisterErrorState(this.error);
}
/*
   name: name,
      email: email,
      password: password,
      phone: phone,
*/
class ValidateNameState extends RegisterState {
  final bool isValidate;

  ValidateNameState({required this.isValidate});
}

class ValidatePasswordState extends RegisterState {
  final bool isValidate;

  ValidatePasswordState({required this.isValidate});
}

class ValidateEmailState extends RegisterState {
  final bool isValidate;

  ValidateEmailState({required this.isValidate});
}

class ValidatePhoneState extends RegisterState {
  final bool isValidate;

  ValidatePhoneState({required this.isValidate});
}

class RegisterChavgePassVisiblityState extends RegisterState {}
