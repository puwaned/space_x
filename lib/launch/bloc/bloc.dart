import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/launch/bloc/event.dart';
import 'package:spacex/launch/bloc/state.dart';

import '../../repo/launch_repo.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  final LaunchRepository _repo;

  LaunchBloc(this._repo) : super(LaunchLoadingState()) {
    on<LoadLaunchEvent>((event, emit) async {
      emit(LaunchLoadingState());
      try {
        final list = await _repo.getAll(event.filter);
        emit(LaunchLoadedState(list, event.filter));
      } catch (err) {
        emit(LaunchErrorState(err.toString(), event.filter));
      }
    });

    on<LoadMoreLaunchEvent> ((event, emit) async {
      try {
        var prev = event.prevDocs;
        final list = await _repo.getAll(event.filter);
        list.docs = [...prev, ...list.docs];
        emit(LaunchLoadedState(list, event.filter));
      }
      catch (err) {

      }
    });
  }
}
