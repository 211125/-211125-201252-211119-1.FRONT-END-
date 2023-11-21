import 'package:equatable/equatable.dart';

abstract class PoshReactionState extends Equatable {
  const PoshReactionState();

  @override
  List<Object?> get props => [];
}

class PoshReactionInitial extends PoshReactionState {}

class PoshReactionLoading extends PoshReactionState {}

class PoshReactionSuccess extends PoshReactionState {}

class PoshReactionFailure extends PoshReactionState {
  final String error;

  PoshReactionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
