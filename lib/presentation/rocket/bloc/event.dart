

import 'package:equatable/equatable.dart';

abstract class RocketEvent extends Equatable {
  const RocketEvent();
}

class LoadRocketEvent extends RocketEvent {
  const LoadRocketEvent();

  @override
  List<Object?> get props => [];

}