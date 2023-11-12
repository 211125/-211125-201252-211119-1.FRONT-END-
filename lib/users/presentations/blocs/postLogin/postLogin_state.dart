
import '../../../domain/entities/userLogin.dart';

abstract class PostLoginState {}

class PostLoginInitial extends PostLoginState {}

class PostLoginLoading extends PostLoginState {}

class PostLoginSuccess extends PostLoginState {
  final UserLogin? user;

   PostLoginSuccess(this.user);
}

class PostLoginFailure extends PostLoginState {
  final String message;

  PostLoginFailure({required this.message});
}
