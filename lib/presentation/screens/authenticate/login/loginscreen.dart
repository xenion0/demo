import 'package:demo/busnicess_logic/cubit/login/login_cubit.dart';
import 'package:demo/busnicess_logic/cubit/register/register_cubit.dart';
import 'package:demo/constant/strings.dart';
import 'package:demo/data/repository/auth_repo.dart';
import 'package:demo/presentation/screens/authenticate/login/login_form.dart';
import 'package:demo/presentation/widgets/back_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
    required this.repo,
  }) : super(key: key);
  final AuthenticationRepo repo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => RegisterCubit(repository: repo),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ArrowBack(
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 30, color: Color(0xff323232)),
                  ),
                  //   LoginForm(authService: authService),
                  BlocProvider(
                    create: (context) => LoginCubit(repository: repo),
                    child: LoginForm(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, signupScreen),
                      child: RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: 'Don\'t have an acount?  ',
                              style: TextStyle(
                                color: Color(0xff707070),
                                fontSize: 14,
                              )),
                          TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                  color: Color(0xff3C3C3C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
