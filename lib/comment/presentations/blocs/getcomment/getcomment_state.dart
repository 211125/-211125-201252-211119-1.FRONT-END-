part of 'getcomment_bloc.dart';

@immutable
abstract class GetcommentState extends Equatable {
  const GetcommentState();

  @override
  List<Object> get props => [];
}

class GetcommentInitialState extends GetcommentState {}

class GetcommentLoadingState extends GetcommentState {}

class GetcommentLoadedState extends GetcommentState {
  final List<GetCommentModel> posts;

  const GetcommentLoadedState(this.posts);

  @override
  List<Object> get props => [posts];
}

class GetcommentErrorState extends GetcommentState {
  final String error;

  const GetcommentErrorState(this.error);

  @override
  List<Object> get props => [error];
}
