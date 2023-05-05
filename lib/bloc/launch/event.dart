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
