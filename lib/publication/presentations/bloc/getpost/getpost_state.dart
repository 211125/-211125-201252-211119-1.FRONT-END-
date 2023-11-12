import 'package:equatable/equatable.dart';
import '../../../data/models/getuser_model.dart';

abstract class GetPostState extends Equatable {
  const GetPostState();

  @override
  List<Object> get props => [];
}

class GetPostInitialState extends GetPostState {}

class GetPostLoadingState extends GetPostState {}

class GetPostLoadedState extends GetPostState {
  final List<PostModel> posts;

  const GetPostLoadedState(this.posts);

  @override
  List<Object> get props => [posts];
}

class GetPostErrorState extends GetPostState {
  final String error;

  const GetPostErrorState(this.error);

  @override
  List<Object> get props => [error];
}
