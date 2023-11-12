import 'package:equatable/equatable.dart';

import '../../../data/models/post_user.dart';
abstract class PoshUserEvent {}

class CreateUserEvent extends PoshUserEvent {
  final UserModel user;


  CreateUserEvent({required this.user});
}
