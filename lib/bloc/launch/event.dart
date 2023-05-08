import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spacex/model/launch_model.dart';

@immutable
abstract class LaunchEvent extends Equatable {
  const LaunchEvent();
}

class LoadLaunchEvent extends LaunchEvent {
  @override
  List<Object?> get props => [];
}

class SearchLaunchEvent extends LaunchEvent {
  final String search;

  const SearchLaunchEvent(this.search);

  @override
  List<Object?> get props => [search];
}

class LoadMoreLaunchEvent extends LaunchEvent {
  final int page;
  final List<LaunchModel> prevDocs;

  const LoadMoreLaunchEvent(this.page, this.prevDocs);

  @override
  List<Object?> get props => [page, prevDocs];
}
