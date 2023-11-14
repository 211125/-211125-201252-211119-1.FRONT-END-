import 'package:equatable/equatable.dart';

abstract class GetpdftEvent extends Equatable {
  const GetpdftEvent();

  @override
  List<Object> get props => [];
}

class FetchpdfEvent extends GetpdftEvent {}
