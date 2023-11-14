import 'package:equatable/equatable.dart';
import '../../../data/models/getuser_model.dart';

abstract class GetpdfState extends Equatable {
  const GetpdfState();

  @override
  List<Object> get props => [];
}

class GetpdfInitialState extends GetpdfState {}

class GetpdfLoadingState extends GetpdfState {}

class GetpdfLoadedState extends GetpdfState {
  final List<PostModel> posts;

  const GetpdfLoadedState(this.posts);

  @override
  List<Object> get props => [posts];
}

class GetpdfErrorState extends GetpdfState {
  final String error;

  const GetpdfErrorState(this.error);

  @override
  List<Object> get props => [error];
}
