import 'package:equatable/equatable.dart';

abstract class GetPostEvent extends Equatable {
  const GetPostEvent();

  @override
  List<Object> get props => [];
}

class FetchPostEvent extends GetPostEvent {}
