import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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