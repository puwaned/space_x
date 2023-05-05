import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spacex/model/launch_model.dart';
import 'package:spacex/model/share_model.dart';

@immutable
abstract class LaunchState extends Equatable {}

class LaunchLoadingState extends LaunchState {
  @override
  List<Object?> get props => [];
}

class LaunchLoadedState extends LaunchState {
  final PaginationModel<LaunchModel> data;

  LaunchLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}

class LaunchErrorState extends LaunchState {
  final String error;

  LaunchErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
