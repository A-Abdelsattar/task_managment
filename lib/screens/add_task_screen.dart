import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app/blocs/tasks/tasks_cubit.dart';
import 'package:tasks_app/components/date_bottom.dart';
import 'package:tasks_app/components/head_line_add.dart';
import 'package:tasks_app/screens/view_tasks_screen.dart';

import 'package:tasks_app/src/app_colors_class.dart';
import 'package:tasks_app/utils/app_navigator.dart';

import '../components/status_bottom.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime? startDate;
  DateTime? endDate;
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksState>(listener: (context, state) {
      if (state is AddTaskSuccess) {
        AppNavigator.navigateToNewScreen(context, ViewTasksScreen(), true);
      }
      else if (state is AddTaskLoading)
        CircularProgressIndicator();
      else if (state is AddTaskError)
        print('input error');
    }, builder: (context, state) {
      var cubit = TasksCubit.get(context);
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'New Task',
              style: TextStyle(
                  color: AppColors.kMainColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _globalKey.currentState!.validate();
              cubit.addTask();
            },
            backgroundColor: AppColors.kMainColor,
            child: Icon(Icons.add),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _globalKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HeadLineAdd(title: 'Title'),
                    TextFormField(
                      controller: cubit.titleController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Title must not be empty';
                        }
                      },
                      decoration:const InputDecoration(
                          border: OutlineInputBorder(gapPadding: 0),
                          label: Text('Do important something')),
                    ),
                    HeadLineAdd(title: 'Description'),
                    TextFormField(
                      maxLines: 8,
                      controller: cubit.descriptionController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Description must not be empty';
                        }
                      },
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Description',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        hintText: 'Description',
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            HeadLineAdd(title: 'StartTime'),
                            DateBottom(
                                title: 'StartDate',
                                onValue: (value) {
                                  startDate = value;
                                  cubit.startDateTime=value;
                                })
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            HeadLineAdd(title: 'EndDate'),
                            DateBottom(
                                title: 'EndDate',
                                onValue: (value) {
                                  endDate = value;
                                  cubit.endDateTime=value;
                                  print('End Date ${endDate.toString()}');
                                  print('End Date Cubit ${cubit.endDateTime.toString()}');
                                })
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
