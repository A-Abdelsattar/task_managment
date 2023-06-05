import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/blocs/authentication/authentication_cubit.dart';
import 'package:tasks_app/components/dash_button.dart';
import 'package:tasks_app/screens/add_task_screen.dart';
import 'package:tasks_app/screens/profile_screen.dart';
import 'package:tasks_app/screens/view_tasks_screen.dart';
import 'package:tasks_app/src/app_colors_class.dart';
import 'package:tasks_app/utils/app_navigator.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../service/sp_helper/sp_helper.dart';
import '../service/sp_helper/sp_keys.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:  Padding(
          padding: EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: (){
              AppNavigator.navigateToNewScreen(context, ProfileScreen(), false);
            },
            child: CircleAvatar(
              radius: 1.0,
              backgroundImage: AssetImage(
                  'assets/image/profile.jpg'),
            ),
          ),
        ),
        leadingWidth: 90.w,
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Welcome, ",
                  style: TextStyle(color: Colors.black),
                ),
                Icon(
                  Icons.back_hand,
                  color: Colors.yellow,
                  size: 20,
                ),
              ],
            ),
            Text(
              AuthenticationCubit.get(context).authenticationModel!.user!.name!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Text('3 tasks for you today.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: AppColors.kMainColor),),
          Image.network('https://img.freepik.com/free-vector/flat-timeline-infographic-template_23-2148906597.jpg',height: 250.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DashButton(function: (){
                AppNavigator.navigateToNewScreen(context, AddTaskScreen(), false);
              },icon: Icons.task_alt, title: 'New Tasks'),
              DashButton(function: (){
                AppNavigator.navigateToNewScreen(context, ViewTasksScreen(), false);
              },icon: Icons.view_quilt_outlined, title: 'View Tasks\nwith state')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DashButton(function: (){

              },icon: Icons.date_range, title: 'View Tasks\nWith date'),
              DashButton(function: (){
                AppNavigator.navigateToNewScreen(context, ProfileScreen(), false);
              },icon: Icons.person, title: 'View Profile')
            ],
          ),
          DashButton(icon: Icons.logout, title: 'Logout', function: (){
            SharedPreferenceHelper.removeData(key: SharedPreferencesKeys.token);
            AppNavigator.navigateToNewScreen(context, LoginScreen(), true);
          })
        ],
      )
    );
  }
}
