import 'package:equatable/equatable.dart';

abstract class GetaudiotEvent extends Equatable {
  const GetaudiotEvent();

  @override
  List<Object> get props => [];
}

class FetchaudioEvent extends GetaudiotEvent {}
