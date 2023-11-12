abstract class PostLoginEvent {}

class PostLoginStarted extends PostLoginEvent {
  final String email;
  final String password;

  PostLoginStarted({required this.email, required this.password});
}