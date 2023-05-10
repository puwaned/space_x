import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:spacex/model/launch_pad_model.dart';

@immutable
abstract class LaunchPadState extends Equatable {}

class LaunchPadLoadingState extends LaunchPadState {
  @override
  List<Object?> get props => [];
}

class LaunchPadLoadedState extends LaunchPadState {
  final LaunchPadModel data;

  LaunchPadLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}

class LaunchPadErrorState extends LaunchPadState {
  final String error;

  LaunchPadErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
