import 'package:equatable/equatable.dart';

import '../../../data/models/post_login.dart';

abstract class PoshReactionEvent extends Equatable {
  const PoshReactionEvent();

  @override
  List<Object?> get props => [];
}

class PostReactionEvent extends PoshReactionEvent {
  final ReactionModel user;

  PostReactionEvent(this.user);

  @override
  List<Object?> get props => [user];
}
