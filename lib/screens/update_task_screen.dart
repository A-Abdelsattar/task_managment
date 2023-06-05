import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/blocs/tasks/tasks_cubit.dart';
import 'package:tasks_app/components/date_bottom.dart';
import 'package:tasks_app/components/drop_down_item.dart';
import 'package:tasks_app/components/head_line_add.dart';
import 'package:tasks_app/components/my_button.dart';
import 'package:tasks_app/screens/view_tasks_screen.dart';
import 'package:tasks_app/service/dio_helper/endPoint.dart';
import 'package:tasks_app/src/app_colors_class.dart';
import 'package:tasks_app/utils/app_navigator.dart';

import '../models/all_tasks_model.dart';

class UbdateTaskScreen extends StatefulWidget {
  int id;
  Task task;
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  UbdateTaskScreen({required this.id, required this.task});

  @override
  State<UbdateTaskScreen> createState() => _UbdateTaskScreenState();
}

class _UbdateTaskScreenState extends State<UbdateTaskScreen> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    widget.titleController.text = widget.task.title!;
    widget.descriptionController.text = widget.task.description!;
    startDate = DateTime.parse(widget.task.startDate ?? '');
    endDate = DateTime.parse(widget.task.endDate ?? '');
    TasksCubit.get(context).startDateTime = startDate;
    TasksCubit.get(context).endDateTime = endDate;
    return BlocConsumer<TasksCubit, TasksState>(listener: (context, state) {
      if (state is UpdateTaskSuccess) {
        AppNavigator.navigateToNewScreen(context, ViewTasksScreen(), true);
        // ToastConfig.showToast(msg: 'Task Updated Successfully', toastStates: ToastStates.Success);
      }
    }, builder: (context, state) {
      var cubit = TasksCubit.get(context);

      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Update Task',
              style: TextStyle(
                  color: AppColors.kMainColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _globalKey,
                child: Column(
                  children: [
                    HeadLineAdd(title: 'Title'),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Title must not be empty';
                        }
                      },
                      controller: widget.titleController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(gapPadding: 0),
                          label: Text('Do important something')),
                    ),
                    HeadLineAdd(title: 'Description'),
                    TextFormField(
                      maxLines: 8,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Description must not be empty';
                        }
                      },
                      controller: widget.descriptionController,
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
                    HeadLineAdd(title: 'State'),
                    DropDownItem(widget.task.status!),
                    SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DateBottom(
                            title: 'StartDate',
                            date: startDate,
                            onValue: (value) {
                              startDate = value;
                              cubit.startDateTime = value;
                            }),

                        DateBottom(
                            title: 'EndDate',
                            date: endDate,
                            onValue: (value) {
                              endDate = value;
                              cubit.endDateTime = value;
                            }),
                      ],
                    ),
                    state is UpdateTaskLoading
                        ? CircularProgressIndicator(
                            color: AppColors.kMainColor,
                          )
                        : MyButton(
                            label: 'Update',
                            function: () {
                              print(status.toString());
                              _globalKey.currentState!.validate();
                              cubit.updateTask(
                                  widget.id,
                                  widget.titleController.text,
                                  widget.descriptionController.text,
                                  status == ''
                                      ? widget.task.status!.toString()
                                      : status.toString());
                              status ='';
                            },
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
