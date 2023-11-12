import 'package:equatable/equatable.dart';

abstract class GetgiftEvent extends Equatable {
  const GetgiftEvent();

  @override
  List<Object> get props => [];
}

class FetchgifEvent extends GetgiftEvent {}
