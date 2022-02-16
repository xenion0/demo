import 'package:bloc/bloc.dart';
import 'package:demo/data/models/response.dart';
import 'package:demo/data/repository/auth_repo.dart';
import 'package:demo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repository}) : super(LoginInitial());
  final AuthenticationRepo repository;
  late ResponseData data;
  bool isPassword = true;
  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> userLogin({required email, required password}) async {
    emit(LoginLoading());
    var response = await repository.userLogin(email: email, password: password);

    try {
      print(response.data);
      data = ResponseData.fromJson(response.data);
      emit(LoginSuccessState(data));
    } catch (e) {
      print(response.data);
      data = ResponseData.fromJson(response.data);
      print(data.message);
      emit(LoginErrorState(e.toString()));
    }
  }
  IconData suffix = Icons.visibility_outlined;

    void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(LoginChavgePassVisiblityState());
  }

    validateEmail(String email) {
    var isValid = Validators.isValidEmail(email);
    emit(ValidateEmailState(isValidate: isValid));
    return isValid;
  }

  validatePassword(String password) {
    var isValid = Validators.isValidPassword(password);
    emit(ValidatePasswordState(isValidate: isValid));
    return isValid;
  }
}
