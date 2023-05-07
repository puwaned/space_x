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
  final String? search;

  LaunchLoadedState(this.data, [this.search]);

  @override
  List<Object?> get props => [data, search];
}

class LaunchErrorState extends LaunchState {
  final String error;
  final String? search;

  LaunchErrorState(this.error, [this.search]);

  @override
  List<Object?> get props => [error, search];
}
