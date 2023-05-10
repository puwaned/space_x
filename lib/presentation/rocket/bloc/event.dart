

import 'package:equatable/equatable.dart';

abstract class RocketEvent extends Equatable {
  const RocketEvent();
}

class LoadRocketEvent extends RocketEvent {
  final String id;

  const LoadRocketEvent(this.id);

  @override
  List<Object?> get props => [id];

}