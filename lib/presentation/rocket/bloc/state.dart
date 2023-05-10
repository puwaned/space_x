
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:spacex/model/rocket_model.dart';

@immutable
abstract class RocketState extends Equatable {
  const RocketState();
}

class RocketLoadingState extends RocketState {
  @override
  List<Object?> get props => [];
}

class RocketLoadedState extends RocketState {
  final RocketModel data;

  const RocketLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}

class RocketErrorState extends RocketState {
  final String error;

  const RocketErrorState(this.error);

  @override
  List<Object?> get props => [error];
}