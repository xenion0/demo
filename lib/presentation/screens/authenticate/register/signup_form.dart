import 'package:demo/busnicess_logic/cubit/register/register_cubit.dart';
import 'package:demo/constant/strings.dart';
import 'package:demo/data/services/shared_preferences.dart';
import 'package:demo/presentation/widgets/form_field.dart';
import 'package:demo/presentation/widgets/graidienbuttom.dart';
import 'package:demo/presentation/widgets/password_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late RegisterCubit _registerCubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var registerCubit = RegisterCubit.get(context);

    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      final ScaffoldMessengerState scaffoldMessenger =
          ScaffoldMessenger.of(context);
      if (state is RegisterLoading) {
        scaffoldMessenger.removeCurrentSnackBar();
        scaffoldMessenger.showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xffffae88),
            content: Row(
              children: const [
                Text('Registering...'),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
              ],
            ),
          ),
        );
      }
      if (state is RegisterSuccessState) {
        if (state.data.status!) {
          CacheHelper.saveData(key: TOKEN, value: state.data.data!.token);
          Navigator.pushReplacementNamed(context, homeScreen);
        } else {
          scaffoldMessenger.showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(child: Text(state.data.message!)),
                Icon(Icons.error),
              ],
            ),
            backgroundColor: const Color(0xffffae88),
          ));
        }
      }
      if (state is RegisterErrorState) {
        var message = state.error;

        scaffoldMessenger.showSnackBar(SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(child: Text(message)),
              Icon(Icons.error),
            ],
          ),
          backgroundColor: const Color(0xffffae88),
        ));
      }
    }, builder: (context, state) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 40),
            CustomFormField(
              controller: _nameController,
              onTap: () {},
              validat: (value) {
                if (value.toString().isEmpty) {
                  return "This filed is Required";
                } else if (!registerCubit.validateName(value)) {
                  return "Invalid Name";
                } else {
                  return null;
                }
              },
              textInputType: TextInputType.text,
              labelTx: 'Name',
            ),
            CustomFormField(
              controller: _emailController,
              onTap: () {},
              validat: (value) {
                return !registerCubit.validateEmail(value)
                    ? 'Invalid Email'
                    : null;
              },
              textInputType: TextInputType.emailAddress,
              labelTx: 'Email',
            ),
            CustomFormField(
              controller: _phoneController,
              onTap: () {},
              validat: (value) {
                return !registerCubit.validatePhone(value)
                    ? 'Invalid Phone number'
                    : null;
              },
              textInputType: TextInputType.phone,
              labelTx: 'Phone',
            ),
            passwordTextFormField(
              label: 'Password',
              controller: _passwordController,
              suffix: registerCubit.suffix,
              type: TextInputType.text,
              suffixPressed: () {
                registerCubit.changePasswordVisibility();
              },
              validate: (value) {
                print(value);
                return !registerCubit.validatePassword(value)
                    ? 'Invalid Password'
                    : null;
              },
              isPassword: registerCubit.isPassword,
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
                        registerCubit.userRegister(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          phone: _phoneController.text,
                        );
                      }
                    },
                    height: 48,
                    width: 315,
                    gradient: const LinearGradient(
                      colors: <Color>[Color(0xff667EEA), Color(0xff64B6FF)],
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Color(0xffFFFFFF)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
