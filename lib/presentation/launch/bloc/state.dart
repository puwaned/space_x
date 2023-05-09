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
  final LaunchFilter filter;

  LaunchLoadedState(this.data, this.filter);

  @override
  List<Object?> get props => [data, filter];
}

class LaunchErrorState extends LaunchState {
  final String error;
  final LaunchFilter filter;

  LaunchErrorState(this.error, this.filter);

  @override
  List<Object?> get props => [error, filter];
}

class LaunchLoadMoreErrorState extends LaunchState {
  final String error;
  final LaunchFilter filter;

  LaunchLoadMoreErrorState(this.error, this.filter);

  @override
  List<Object?> get props => [error, filter];
}
// class LaunchLoadMoreState extends LaunchState {
//   final bool loading;
//
//   LaunchLoadMoreState(this.loading);
//
//   @override
//   List<Object?> get props => [loading];
// }
