import 'package:equatable/equatable.dart';
import '../../../data/models/getuser_model.dart';

abstract class GetaudioState extends Equatable {
  const GetaudioState();

  @override
  List<Object> get props => [];
}

class GetaudioInitialState extends GetaudioState {}

class GetaudioLoadingState extends GetaudioState {}

class GetaudioLoadedState extends GetaudioState {
  final List<PostModel> posts;

  const GetaudioLoadedState(this.posts);

  @override
  List<Object> get props => [posts];
}

class GetaudioErrorState extends GetaudioState {
  final String error;

  const GetaudioErrorState(this.error);

  @override
  List<Object> get props => [error];
}
