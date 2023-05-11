import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/presentation/launch_pad/bloc/event.dart';
import 'package:spacex/presentation/launch_pad/bloc/state.dart';
import 'package:spacex/presentation/shared/http_status.dart';

import '../../../repo/launch_pad_repo.dart';

class LaunchPadBloc extends Bloc<LaunchPadEvent, LaunchPadState> {
  final LaunchPadRepository _repo;
  final String _id;

  LaunchPadBloc(this._repo, this._id) : super(const LaunchPadState()) {
    on<LoadLaunchPadEvent>((event, emit) async {
      emit(const LaunchPadState(status: HttpRequestStatus.loading));
      try {
        final data = await _repo.getOne(_id);
        emit(LaunchPadState(status: HttpRequestStatus.success, data: data));
      } catch (err) {
        emit(LaunchPadState(
            status: HttpRequestStatus.failed,
            error: err.toString(),
            data: null));
      }
    });
  }
}
