import 'package:equatable/equatable.dart';
import 'package:spacex/model/rocket_model.dart';

import '../../shared/http_status.dart';

class RocketState extends Equatable {
  final RocketModel? data;
  final String error;
  final HttpRequestStatus status;

  const RocketState(
      {this.data, this.status = HttpRequestStatus.initial, this.error = ""});

  @override
  List<Object?> get props => [data, error, status];
}