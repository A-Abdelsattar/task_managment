import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tasks_app/screens/register_screen.dart';
import 'package:tasks_app/utils/toast.dart';
import 'package:tasks_app/utils/toast_states.dart';
import 'package:text_divider/text_divider.dart';

import '../blocs/authentication/authentication_cubit.dart';
import '../components/my_button.dart';
import '../components/my_text_field.dart';
import '../src/app_colors_class.dart';
import '../utils/app_navigator.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
      var cubit = AuthenticationCubit.get(context);
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Image.network(
                    'https://img.icons8.com/external-flaticons-flat-circular-flat-icons/512/external-tasks-automation-technology-flaticons-flat-circular-flat-icons.png',
                    height: 150.h,
                  ),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kMainColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Please enter your account here',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  MyTextField(
                      label: 'Email',
                      controller: cubit.emailController,
                      icon: Icons.email_outlined),
                  MyTextField(
                      label: 'Password',
                      controller: cubit.passwordController,
                      isPassword: true,
                      icon: Icons.lock),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Forgot password?'),
                          ))),
                  if (state is AuthenticationLoginLoading)
                    CircularProgressIndicator(
                      color: AppColors.kMainColor,
                    ),
                  MyButton(
                      label: 'Login'.toUpperCase(),
                      function: () {
                        _globalKey.currentState!.validate();
                        cubit.login();
                      }),
                  TextDivider.horizontal(text: const Text('Or continue with')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Don\'t have an account? '),
                        TextButton(
                            onPressed: () {
                              AppNavigator.navigateToNewScreen(
                                  context, RegisterScreen(), true);
                            },
                            child: Text('Register'))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is AuthenticationLoginSuccess) {
        AppNavigator.navigateToNewScreen(context, HomeScreen(), false);
      }
    });
  }
}
