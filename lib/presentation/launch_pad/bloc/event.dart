
import 'package:equatable/equatable.dart';

abstract class LaunchPadEvent extends Equatable {
  const LaunchPadEvent();
}

class LoadLaunchPadEvent extends LaunchPadEvent {
  final String id;

  const LoadLaunchPadEvent(this.id);

  @override
  List<Object?> get props => [];
}