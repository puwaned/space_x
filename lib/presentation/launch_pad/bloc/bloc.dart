import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/presentation/launch_pad/bloc/event.dart';
import 'package:spacex/presentation/launch_pad/bloc/state.dart';

import '../../../repo/launch_pad_repo.dart';

class LaunchPadBloc extends Bloc<LaunchPadEvent, LaunchPadState> {
  final LaunchPadRepository _repo;
  LaunchPadBloc(this._repo) : super(LaunchPadLoadingState()) {
    on<LoadLaunchPadEvent>((event, emit) async {
      emit(LaunchPadLoadingState());
      try {
        final data = await _repo.getOne(event.id);
        emit(LaunchPadLoadedState(data));
      } catch (err) {
        emit(LaunchPadErrorState(err.toString()));
      }
    });
  }
}
