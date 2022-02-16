import 'package:demo/constant/strings.dart';
import 'package:demo/data/repository/auth_repo.dart';
import 'package:demo/presentation/screens/authenticate/first_screen.dart';
import 'package:demo/presentation/screens/authenticate/login/loginscreen.dart';
import 'package:demo/presentation/screens/authenticate/register/sugnup_screen.dart';
import 'package:demo/presentation/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late AuthenticationRepo repo;

  AppRouter() {
    repo = AuthenticationRepo();
  }
  Route? generaterRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case firstScreen:
        return MaterialPageRoute(builder: (_) => const FirstScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen(repo: repo));
      case signupScreen:
        return MaterialPageRoute(
          builder: (_) => SignupScreen(
            repo: repo,
          ),
        );
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
      
    }
  }

 
}
