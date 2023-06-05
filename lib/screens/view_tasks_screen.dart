import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/blocs/tasks/tasks_cubit.dart';
import 'package:tasks_app/screens/home_screen.dart';
import 'package:tasks_app/screens/single_task_screen.dart';
import 'package:tasks_app/utils/app_navigator.dart';

import '../components/status_bottom.dart';
import '../src/app_colors_class.dart';

class ViewTasksScreen extends StatelessWidget {
  const ViewTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TasksCubit.get(context);
          return Scaffold(
              // backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(onPressed: (){
                  AppNavigator.navigateToNewScreen(context, HomeScreen(), true);
                }, icon: Icon(Icons.arrow_back),
                  
                ),
                title: Text(
                  'Tasks',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                      color: AppColors.kMainColor),
                ),
                centerTitle: true,

              ),
              body: Column(
                children: <Widget>[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        StatusBottom(title: 'All',function: (){
                          cubit.status='';
                          cubit.getAllTasks();
                        },
                        isActive: cubit.status == '',),
                        StatusBottom(title: 'New',function: (){
                          cubit.status='new';
                          cubit.getTasksWithStatus();
                        },
                          isActive: cubit.status == 'new'),
                        StatusBottom(title: 'InProgress',function: (){
                          cubit.status='in_progress';
                          cubit.getTasksWithStatus();
                        },
                          isActive: cubit.status == 'in_progress'),
                        StatusBottom(title: 'Completed',function: (){
                          cubit.status='Completed';
                          cubit.getTasksWithStatus();
                        },
                          isActive: cubit.status == 'Completed'
                        ),
                        StatusBottom(title: 'outDate',function: (){
                          cubit.status='outDate';
                          cubit.getTasksWithStatus();
                        },
                          isActive: cubit.status == 'outDate',
                        ),
                      ],
                    ),
                  ),
                  cubit.allTasksModel == null
                      ? Center(
                          child: CircularProgressIndicator(
                          color: AppColors.kMainColor,
                        ))
                      : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount:
                                cubit.allTasksModel!.response!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5),
                                child: GestureDetector(
                                  onTap: (){
                                    AppNavigator.navigateToNewScreen(context, SingleTaskScreen(task: cubit.allTasksModel!.response![index], id: cubit.allTasksModel!.response![index].id!,), false);
                                  },
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10),
                                    elevation: 5,
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey[200]),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '${cubit.allTasksModel!.response![index].title}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.sp,
                                                    color: AppColors.kMainColor),
                                              ),
                                              Spacer(),
                                              IconButton(onPressed: (){
                                                cubit.deleteTask(cubit.allTasksModel!.response![index].id!);
                                              }, icon: Icon(Icons.delete_forever,color: Colors.red,))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Description: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                  '${cubit.allTasksModel!.response![index].description}'),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Start Date: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                  '${cubit.allTasksModel!.response![index].startDate.toString()}')
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'End Date: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                  '${cubit.allTasksModel!.response![index].endDate.toString()}')
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Status: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                  '${cubit.allTasksModel!.response![index].status}')
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                ],
              ));
        });
  }
}
