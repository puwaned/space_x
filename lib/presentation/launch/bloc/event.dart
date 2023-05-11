import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spacex/model/launch_model.dart';

@immutable
abstract class LaunchEvent extends Equatable {
  const LaunchEvent();
}

class LoadLaunchEvent extends LaunchEvent {
  final LaunchFilter filter;

  const LoadLaunchEvent({required this.filter});

  @override
  List<Object?> get props => [filter];
}

class LoadMoreLaunchEvent extends LaunchEvent {
  final LaunchFilter filter;
  final List<LaunchModel> prevDocs;

  const LoadMoreLaunchEvent(this.filter, this.prevDocs);

  @override
  List<Object?> get props => [filter, prevDocs];
}
