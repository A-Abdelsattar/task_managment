import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tasks_app/blocs/authentication/authentication_cubit.dart';
import 'package:tasks_app/blocs/tasks/tasks_cubit.dart';
import 'package:tasks_app/components/drop_down_item.dart';
import 'package:tasks_app/screens/add_task_screen.dart';
import 'package:tasks_app/screens/home_screen.dart';
import 'package:tasks_app/screens/onboarding_screen.dart';
import 'package:tasks_app/screens/profile_screen.dart';
import 'package:tasks_app/screens/register_screen.dart';
import 'package:tasks_app/screens/single_task_screen.dart';
import 'package:tasks_app/screens/view_tasks_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context,child){
        return  MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=>AuthenticationCubit()),
            BlocProvider(create: (context)=>TasksCubit()..getAllTasks()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home:
            // ProfileScreen(),
            // RegisterScreen() ,
            OnboardingScreen(),
            //ViewTasksScreen()
            // AddTaskScreen()
           //HomeScreen()

            theme: ThemeData(
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.grey
                )
              )
            ),

          ),
        );
      },
    );
  }
}
