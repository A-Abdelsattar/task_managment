part of 'tasks_cubit.dart';

@immutable
abstract class TasksState {}

class TasksInitial extends TasksState {}

class GetAllTasksLoading extends TasksState {}
class GetAllTasksSuccess extends TasksState {}
class GetAllTasksError extends TasksState {}



class AddTaskLoading extends TasksState {}
class AddTaskSuccess extends TasksState {}
class AddTaskError extends TasksState {}

class UpdateTaskLoading extends TasksState {}
class UpdateTaskSuccess extends TasksState {}
class UpdateTaskError extends TasksState {}

class DeleteTaskLoading extends TasksState {}
class DeleteTaskSuccess extends TasksState {}
class DeleteTaskError extends TasksState {}