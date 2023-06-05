import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/blocs/authentication/authentication_cubit.dart';
import 'package:tasks_app/components/my_button.dart';
import 'package:tasks_app/components/my_text_field.dart';
import 'package:tasks_app/screens/home_screen.dart';
import 'package:tasks_app/screens/login_screen.dart';
import 'package:tasks_app/utils/app_navigator.dart';
import 'package:text_divider/text_divider.dart';
import '../src/app_colors_class.dart';

class RegisterScreen extends StatelessWidget {
  GlobalKey<FormState>_globalKey=GlobalKey<FormState>();

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
                    width: 200.w,
                  ),
                  Text(
                    'Registration!'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kMainColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Please register down below',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  MyTextField(
                      label: 'Full name',
                      controller: cubit.nameController,
                      icon: Icons.person),
                  MyTextField(
                      label: 'Email',
                      controller: cubit.emailController,
                      icon: Icons.email_outlined),
                  MyTextField(
                      label: 'Password',
                      controller: cubit.passwordController,
                      isPassword: true,
                      icon: Icons.lock),
                  if (state is AuthenticationRegisterLoading)
                    LinearProgressIndicator(
                      color: AppColors.kMainColor,
                    ),
                  MyButton(
                      label: 'Register'.toUpperCase(),
                      function: () {
                        _globalKey.currentState!.validate();
                        cubit.register();
                      }),
                  TextDivider.horizontal(text: const Text('Or continue with')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Already have an account? '),
                        TextButton(
                            onPressed: () {
                              AppNavigator.navigateToNewScreen(
                                  context, LoginScreen(), true);
                            },
                            child: Text('Log in'))
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
      if (state is AuthenticationRegisterSuccess) {
        AppNavigator.navigateToNewScreen(context, HomeScreen(), false);
      }
    });
  }
}
