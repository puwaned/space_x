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
        final list = await _repo.getAll(page: 1);
        emit(LaunchLoadedState(list));
      } catch (err) {
        emit(LaunchErrorState(err.toString()));
      }
    });

    on<SearchLaunchEvent>(
      (event, emit) async {
        emit(LaunchLoadingState());
        try {
          var list = await _repo.getAll(page: 1, search: event.search);
          emit(LaunchLoadedState(list, event.search));
        } catch (err) {
          emit(LaunchErrorState(err.toString(), event.search));
        }
      },
    );

    on<LoadMoreLaunchEvent>((event, emit) async {
      // emit(LaunchLoadMoreState(event.));
      try {
        var list = await _repo.getAll(page: event.page);
        var docs = [...event.prevDocs, ...list.docs];
        list.docs = docs;
        emit(LaunchLoadedState(list));
      } catch (err) {
        print(err);
      }
    });
  }
}
