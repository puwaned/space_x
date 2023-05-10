import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/presentation/rocket/bloc/event.dart';
import 'package:spacex/presentation/rocket/bloc/state.dart';

import '../../../repo/rocket_repo.dart';

class RocketBloc extends Bloc<RocketEvent, RocketState> {
  final RocketRepository _repo;

  RocketBloc(this._repo) : super(RocketLoadingState()) {
    on<LoadRocketEvent>((event, emit) async {
      emit(RocketLoadingState());
      try {
        final data = await _repo.getOne(event.id);
        emit(RocketLoadedState(data));
      } catch (err) {
        emit(RocketErrorState(err.toString()));
      }
    });
  }
}
