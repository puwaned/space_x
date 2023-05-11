import 'package:equatable/equatable.dart';
import 'package:spacex/model/launch_model.dart';
import 'package:spacex/model/share_model.dart';
import 'package:spacex/presentation/shared/http_status.dart';

class LaunchState extends Equatable {
  final PaginationModel<LaunchModel> data;
  final LaunchFilter filter;
  final HttpRequestStatus status;
  final String error;

  const LaunchState(
      {required this.data,
      required this.filter,
      required this.status,
      this.error = ""});

  LaunchState copyWith(
      {HttpRequestStatus? status,
      LaunchFilter? filter,
      String? error,
      PaginationModel<LaunchModel>? data}) {
    return LaunchState(
        filter: filter ?? this.filter,
        status: status ?? this.status,
        error: error ?? this.error,
        data: data ?? this.data);
  }

  @override
  List<Object?> get props => [filter, status, error, data];
}
