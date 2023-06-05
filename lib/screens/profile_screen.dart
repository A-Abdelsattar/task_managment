import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/components/my_button.dart';
import 'package:tasks_app/components/my_text_field.dart';
import 'package:tasks_app/src/app_colors_class.dart';

import '../blocs/authentication/authentication_cubit.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>( listener: (context,state){},builder: (context,state){
      var model = AuthenticationCubit.get(context).authenticationModel;
      var cubit=AuthenticationCubit.get(context);
      nameController.text=model!.user!.name!;
      emailController.text=model.user!.email!;
      return Scaffold(
        backgroundColor: AppColors.kMainColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'My Profile',
            style: TextStyle(color: AppColors.kMainColor),
          ),
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            height: 400.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white
            ),
            child: Column(
              children: [
                SizedBox(height:20.h),
                CircleAvatar(
                  radius: 80.h,
                  backgroundImage: Image.asset('assets/image/profile.jpg'
                  ).image,

                ),
                MyTextField(
                    label: "Name", controller: nameController, icon: Icons.person,edit: false,),
                MyTextField(
                  edit: false,
                    label: "Email Address",
                    controller: emailController,
                    icon: Icons.email),
                // MyButton(label: "Update", function: (){
                //   cubit.updateUserData(nameController.text);
                //
                // })
              ],
            ),
          ),
        ),
      );
    },);
  }
}
