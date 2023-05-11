import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/model/launch_model.dart';
import 'package:spacex/model/share_model.dart';
import 'package:spacex/presentation/launch/bloc/event.dart';
import 'package:spacex/presentation/launch/bloc/state.dart';
import 'package:spacex/presentation/shared/http_status.dart';

import '../../../repo/launch_repo.dart';

final prefilter = LaunchFilter.empty();
final preData = PaginationModel<LaunchModel>.empty();

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  final LaunchRepository _repo;

  LaunchBloc(this._repo)
      : super(LaunchState(
            status: HttpRequestStatus.initial,
            data: preData,
            filter: prefilter,
            error: "")) {
    on<LoadLaunchEvent>((event, emit) async {
      emit(LaunchState(
          status: HttpRequestStatus.loading,
          filter: event.filter,
          data: preData,
          error: ""));

      try {
        final data = await _repo.getAll(event.filter);
        emit(LaunchState(
            status: HttpRequestStatus.success,
            data: data,
            filter: event.filter));
      } catch (err) {
        emit(LaunchState(
            status: HttpRequestStatus.failed,
            error: err.toString(),
            data: preData,
            filter: event.filter));
      }
    });

    on<LoadMoreLaunchEvent>((event, emit) async {
      try {
        var prev = event.prevDocs;
        final data = await _repo.getAll(event.filter);
        data.docs = [...prev, ...data.docs];
        emit(LaunchState(
            status: HttpRequestStatus.success,
            data: data,
            filter: event.filter));
      } catch (err) {
        emit(LaunchState(
            status: HttpRequestStatus.failed,
            error: err.toString(),
            data: preData,
            filter: event.filter));
      }
    });
  }
}
