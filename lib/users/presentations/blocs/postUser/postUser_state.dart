import 'package:equatable/equatable.dart';
abstract class PostUserState {}

class PostUserInitial extends PostUserState {}

class PostUserLoading extends PostUserState {}

class PostUserSuccess extends PostUserState {}

class PostUserFailure extends PostUserState {}
