part of 'login_bloc.dart';


@immutable

sealed class LoginState {}


class LoginLoading extends LoginState {}


class LoginError extends LoginState {}


class LoginSuccess extends LoginState {}

