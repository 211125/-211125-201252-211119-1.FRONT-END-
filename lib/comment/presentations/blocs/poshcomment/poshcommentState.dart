part of 'poshcommentBloc.dart';

@immutable
abstract class commentState {}

class commentInitial extends commentState {}

class commentLoading extends commentState {}

class commentSuccess extends commentState {}

class commentFailure extends commentState {
  final String error;

  commentFailure(this.error);

  @override
  List<Object?> get props => [error];
}
