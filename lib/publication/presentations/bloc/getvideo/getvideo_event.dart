import 'package:equatable/equatable.dart';

abstract class GetvideotEvent extends Equatable {
  const GetvideotEvent();

  @override
  List<Object> get props => [];
}

class FetchvideoEvent extends GetvideotEvent {
}
