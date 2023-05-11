import 'package:equatable/equatable.dart';
import 'package:spacex/model/launch_pad_model.dart';

import '../../shared/http_status.dart';

class LaunchPadState extends Equatable {
  final LaunchPadModel? data;
  final String error;
  final HttpRequestStatus status;

  const LaunchPadState(
      {this.data, this.status = HttpRequestStatus.initial, this.error = ""});

  @override
  List<Object?> get props => [data, error, status];
}
