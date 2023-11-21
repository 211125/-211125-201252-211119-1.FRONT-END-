abstract class GetReactionState {}

class GetReactionInitial extends GetReactionState {}

class GetReactionLoading extends GetReactionState {}

class GetReactionLoaded extends GetReactionState {
  final int count;

  GetReactionLoaded(this.count);
}

class GetReactionError extends GetReactionState {
  final String message;

  GetReactionError(this.message);
}