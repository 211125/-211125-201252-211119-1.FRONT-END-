
import '../../../data/models/posh_model.dart';

abstract class CreatePostEvent {}

class CreateUserEvent extends CreatePostEvent {
  final createModel user;



  CreateUserEvent({required this.user});
}

