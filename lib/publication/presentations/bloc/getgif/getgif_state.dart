import 'package:equatable/equatable.dart';
import '../../../data/models/getuser_model.dart';

abstract class GetgifState extends Equatable {
  const GetgifState();

  @override
  List<Object> get props => [];
}

class GetgifInitialState extends GetgifState {}

class GetgifLoadingState extends GetgifState {}

class GetgifLoadedState extends GetgifState {
  final List<PostModel> posts;

  const GetgifLoadedState(this.posts);

  @override
  List<Object> get props => [posts];
}

class GetgifErrorState extends GetgifState {
  final String error;

  const GetgifErrorState(this.error);

  @override
  List<Object> get props => [error];
}
