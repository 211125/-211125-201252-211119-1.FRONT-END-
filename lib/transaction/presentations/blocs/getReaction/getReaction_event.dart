abstract class GetReactionEvent {}

class FetchReactionCountEvent extends GetReactionEvent {
  final int id;

  FetchReactionCountEvent({required this.id});
}
