import 'package:demo/busnicess_logic/cubit/login/login_cubit.dart';
import 'package:demo/busnicess_logic/cubit/login/login_cubit.dart';
import 'package:demo/constant/strings.dart';
import 'package:demo/data/services/shared_preferences.dart';
import 'package:demo/presentation/widgets/form_field.dart';
import 'package:demo/presentation/widgets/graidienbuttom.dart';
import 'package:demo/presentation/widgets/password_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var logincubit = LoginCubit.get(context);

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        final ScaffoldMessengerState scaffoldMessenger =
            ScaffoldMessenger.of(context);
        if (state is LoginLoading) {
          scaffoldMessenger.removeCurrentSnackBar();
          scaffoldMessenger.showSnackBar(
            SnackBar(
              backgroundColor: const Color(0xffffae88),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Login...'),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  )
                ],
              ),
            ),
          );
        }
        if (state is LoginSuccessState) {
          if (state.data.status!) {
            CacheHelper.saveData(key: TOKEN, value: state.data.data!.token);
            Navigator.pushNamedAndRemoveUntil(context, homeScreen, (Route<dynamic> route) => false);
          } else {
            scaffoldMessenger.showSnackBar(SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(child: Text(state.data.message!)),
                  const Icon(Icons.error),
                ],
              ),
              backgroundColor: const Color(0xffffae88),
            ));
          }
        }
        if (state is LoginErrorState) {
          var message = state.error;
          scaffoldMessenger.showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(child: Text(message)),
                const Icon(Icons.error),
              ],
            ),
            backgroundColor: const Color(0xffffae88),
          ));
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              CustomFormField(
                controller: _emailController,
                onTap: () {},
                validat: (value) {
                  return !logincubit.validateEmail(value)
                      ? 'Invalid Email'
                      : null;
                },
                textInputType: TextInputType.emailAddress,
                labelTx: 'Email',
              ),
              passwordTextFormField(
                label: 'Password',
                controller: _passwordController,
                suffix: logincubit.suffix,
                type: TextInputType.text,
                suffixPressed: () {
                  logincubit.changePasswordVisibility();
                },
                validate: (value) {
                  // return !logincubit.validatePassword(value)
                  //     ? 'Invalid Password'
                  //     : null;
                  if (value.toString().isEmpty) {
                    return 'Plz enter your password';
                  } else if (!logincubit.validatePassword(value)) {
                    return 'Invalid Password';
                  }
                },
                isPassword: logincubit.isPassword,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Material(
                    elevation: 10,
                    shadowColor: const Color(0xFF3BB7FF),
                    child: InkwellGradienButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          logincubit.userLogin(
                              email: _emailController.text,
                              password: _passwordController.text);
                        }
                      },
                      height: 48,
                      width: 315,
                      gradient: const LinearGradient(
                        colors: <Color>[Color(0xff667EEA), Color(0xff64B6FF)],
                      ),
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: Color(0xffFFFFFF)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
