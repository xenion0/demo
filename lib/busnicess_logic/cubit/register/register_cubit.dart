// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:demo/data/models/response.dart';
import 'package:demo/data/repository/auth_repo.dart';
import 'package:demo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.repository}) : super(RegisterInitial());
  final AuthenticationRepo repository;
  late ResponseData data;
  bool isPassword = true;

  static RegisterCubit get(context) => BlocProvider.of(context);
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(RegisterLoading());

    var response = await repository.userRegister(
      name: name,
      email: email,
      password: password,
      phone: phone,
    );

    try {
      print(response.data);
      data = ResponseData.fromJson(response.data);
      emit(RegisterSuccessState(data));
    } catch (e) {
      print(response.data);
      data = ResponseData.fromJson(response.data);
      print(data.message);
      emit(RegisterErrorState(e.toString()));
    }
  }

  validateName(String name) {
    var isValid = Validators.isValidName(name);
    emit(ValidateNameState(isValidate: isValid));
    return isValid;
  }

  validateEmail(String email) {
    var isValid = Validators.isValidEmail(email);
    emit(ValidateEmailState(isValidate: isValid));
    return isValid;
  }

  validatePassword(String password) {
    var isValid = Validators.isValidPassword(password);
    emit(ValidatePasswordState(isValidate: isValid));
    print('from password ${isValid}');
    return isValid;
  }

  validatePhone(String phone) {
    var isValid = Validators.isValidPhone(phone);
    emit(ValidatePhoneState(isValidate: isValid));
    return isValid;
  }

  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChavgePassVisiblityState());
  }
}
