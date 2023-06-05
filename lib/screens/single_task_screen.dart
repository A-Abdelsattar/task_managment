import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/blocs/tasks/tasks_cubit.dart';
import 'package:tasks_app/components/head_line_add.dart';
import 'package:tasks_app/screens/update_task_screen.dart';
import 'package:tasks_app/screens/view_tasks_screen.dart';
import 'package:tasks_app/utils/app_navigator.dart';

import '../models/all_tasks_model.dart';
import '../src/app_colors_class.dart';

class SingleTaskScreen extends StatelessWidget {
  Task task;
  int id;

  SingleTaskScreen({required this.task,required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          AppNavigator.navigateToNewScreen(context, ViewTasksScreen(), true);
        }, icon: Icon(Icons.arrow_back),

        ),
        title: Text(
          task.title!,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.sp,
              color: AppColors.kMainColor),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                AppNavigator.navigateToNewScreen(context, UbdateTaskScreen(id:id,task: task,), false);
              },
              icon: Icon(
                Icons.edit,
                color: Colors.black,
              ),),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          HeadLineAdd(title: 'Description'),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[200]),
            child: Text(
              task.description!,
              style: TextStyle(fontSize: 18),
            ),
          ),
          HeadLineAdd(title: 'Status'),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.kMainColor),
            child: Center(
              child: Text(
                task.status!,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  HeadLineAdd(title: 'StartDate'),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: Text(
                      task.startDate.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              Spacer(),
              Column(
                children: [
                  HeadLineAdd(title: 'EndDate'),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: Text(
                      task.endDate.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}



