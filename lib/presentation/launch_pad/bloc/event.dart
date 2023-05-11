import 'package:equatable/equatable.dart';

abstract class LaunchPadEvent extends Equatable {
  const LaunchPadEvent();
}

class LoadLaunchPadEvent extends LaunchPadEvent {
  const LoadLaunchPadEvent();

  @override
  List<Object?> get props => [];
}
