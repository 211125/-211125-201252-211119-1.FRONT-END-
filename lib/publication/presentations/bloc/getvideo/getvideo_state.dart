import 'package:equatable/equatable.dart';
import '../../../data/models/getuser_model.dart';

abstract class GetvideoState extends Equatable {
  const GetvideoState();

  @override
  List<Object> get props => [];
}

class GetvideoInitialState extends GetvideoState {}

class GetvideoLoadingState extends GetvideoState {}

class GetvideoLoadedState extends GetvideoState {
  final List<PostModel> posts;

  const GetvideoLoadedState(this.posts);

  @override
  List<Object> get props => [posts];
}

class GetvideoErrorState extends GetvideoState {
  final String error;

  const GetvideoErrorState(this.error);

  @override
  List<Object> get props => [error];
}
