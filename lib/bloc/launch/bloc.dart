import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/bloc/launch/event.dart';
import 'package:spacex/bloc/launch/state.dart';

import '../../repo/launch_repo.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  final LaunchRepository _repo;

  LaunchBloc(this._repo) : super(LaunchLoadingState()) {
    on<LoadLaunchEvent>((event, emit) async {
      emit(LaunchLoadingState());
      try {
        final list = await _repo.getAll();
        emit(LaunchLoadedState(list));
      } catch (err) {
        emit(LaunchErrorState(err.toString()));
      }
    });
  }
}
