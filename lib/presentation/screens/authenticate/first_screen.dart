import 'package:demo/constant/strings.dart';
import 'package:demo/data/repository/auth_repo.dart';
import 'package:demo/presentation/widgets/graidienbuttom.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: 'Welcome to ',
                      style: TextStyle(
                        color: Color(0xff707070),
                        fontSize: 20,
                      )),
                  TextSpan(
                      text: 'Bolt',
                      style: TextStyle(
                          color: Color(0xff707070),
                          fontSize: 22,
                          fontWeight: FontWeight.w400))
                ]),
              ),
              const Text(
                'Explore Us',
                style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Image.asset(
                'assets/images/firstone.png',
                scale: 0.2,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              InkwellGradienButton(
                onPressed: () =>
                    Navigator.pushNamed(context, loginScreen),
                gradient: const LinearGradient(
                  colors: <Color>[Color(0xff667EEA), Color(0xff64B6FF)],
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(color: Color(0xffFFFFFF)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, signupScreen),
                child: Container(
                  margin: EdgeInsets.all(10),
                  // height: 30,
                  // width: 90,
                  child: const Center(
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        color: Color(0xff454242),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
