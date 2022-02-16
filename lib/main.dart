import 'package:demo/constant/strings.dart';
import 'package:demo/data/services/dio_helper.dart';
import 'package:demo/data/services/shared_preferences.dart';
import 'package:demo/presentation/screens/authenticate/first_screen.dart';
import 'package:demo/presentation/screens/home/home.dart';
import 'package:demo/utils/app_router.dart';
import 'package:demo/utils/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  //===============================================================
  await CacheHelper.init();
  //===============================================================
  Widget widget;
  token = CacheHelper.getString(key: TOKEN) ?? "";
  //=========================

  if (token.isNotEmpty) {
    widget = const HomeScreen();
  } else {
    widget = const FirstScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.startWidget}) : super(key: key);
  final Widget startWidget;
  final AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      initialRoute: firstScreen,
      onGenerateRoute: appRouter.generaterRoute,
      home: startWidget,
    );
  }
}
