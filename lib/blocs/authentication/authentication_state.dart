part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationRegisterSuccess extends AuthenticationState {}
class AuthenticationRegisterError extends AuthenticationState {}
class AuthenticationRegisterLoading extends AuthenticationState {}

class AuthenticationLoginSuccess extends AuthenticationState {}
class AuthenticationLoginError extends AuthenticationState {}
class AuthenticationLoginLoading extends AuthenticationState {}

class AuthenticationUpdateSuccess extends AuthenticationState {}
class AuthenticationUpdateError extends AuthenticationState {}
class AuthenticationUpdateLoading extends AuthenticationState {}