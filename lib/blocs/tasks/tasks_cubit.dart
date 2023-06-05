import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/models/all_tasks_model.dart';
import 'package:tasks_app/service/dio_helper/dio_helper.dart';
import 'package:tasks_app/service/dio_helper/endPoint.dart';
import 'package:tasks_app/service/sp_helper/sp_helper.dart';

import '../../service/sp_helper/sp_keys.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  static TasksCubit get(context) => BlocProvider.of(context);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController voiceController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  DateTime? startDateTime=DateTime.now();
  DateTime? endDateTime=DateTime.now();

  TasksModel? allTasksModel;
  String status = '';

  void changeStatus(String status) {
    this.status = status;
    emit(GetAllTasksSuccess());
  }

  getAllTasks() {
    // print(SharedPreferencesKeys.token);
    emit(GetAllTasksLoading());
    DioHelper.getData(
            url: getTasksEndPoint,
            query: {},
            token: SharedPreferenceHelper.getData(key: 'token'))
        .then((value) {
      print('here 1');
      print(value.data);
      allTasksModel = TasksModel.fromJson(value.data);
      print(value.data);
      emit(GetAllTasksSuccess());
    }).catchError((error) {
      print(error);
      emit(GetAllTasksError());
    });
  }

  getTasksWithStatus() {
    emit(GetAllTasksLoading());
    DioHelper.getData(
            url: getTasksEndPoint,
            query: {'status': status},
            token: SharedPreferenceHelper.getData(
                key: SharedPreferencesKeys.token))
        .then((value) {
      print('here');
      print(value.data);
      allTasksModel = TasksModel.fromJson(value.data);
      print(value.data);
      emit(GetAllTasksSuccess());
    }).catchError((error) {
      print(error);
      emit(GetAllTasksError());
    });
  }

  addTask() {
    emit(AddTaskLoading());
    DioHelper.postData(
            url: getTasksEndPoint,
            data: {
              "title": titleController.text,
              "description": descriptionController.text,
              // "image":'',
              // "voice":'',
              "start_date": startDateTime.toString(),
              "end_date": endDateTime.toString(),
            },
            token: SharedPreferenceHelper.getData(
                key: SharedPreferencesKeys.token))
        .then((value) {
      // allTasksModel=TasksModel.fromJson(value.data);
      emit(AddTaskSuccess());
      getAllTasks();
      titleController.clear();
      descriptionController.clear();
    }).catchError((error) {
      print(error);
      print(error.response?.data);
      emit(AddTaskError());
    });
  }

  TasksModel? updateTaskModel;

  updateTask(
    int id,
    String title,
    String description,
    String status,

  ) {
    emit(UpdateTaskLoading());
    DioHelper.postData(
      url: 'tasks/$id',
      data: {
        "title": title,
        "description": description,
        "image":' ',
        "voice":' ',
        "status": status,
        "start_date": startDateTime.toString(),
        "end_date": endDateTime.toString(),
        '_method':'PUT'
      },
      token: SharedPreferenceHelper.getData(key: SharedPreferencesKeys.token),
    ).then((value) {
      emit(UpdateTaskSuccess());
      //updateTaskModel = TasksModel.fromJson(jsonDecode(value.data));
      getTasksWithStatus();
      print('hrt ${value.data}');
    }).catchError(( error) {
      print(error.toString());
      print('here');
      emit(UpdateTaskError());
    });
  }
  
  
  
  deleteTask(int id){
    emit(DeleteTaskLoading());
    DioHelper.deleteData(url:'tasks/${id}',token: SharedPreferenceHelper.getData(key: SharedPreferencesKeys.token)).then((value) {
      emit(DeleteTaskSuccess());
      getAllTasks();
    }).catchError((error){
      emit(DeleteTaskError());
      print(error.response);
    });
  }
  
}
