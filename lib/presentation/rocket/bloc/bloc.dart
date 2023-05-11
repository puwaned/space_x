import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/presentation/rocket/bloc/event.dart';
import 'package:spacex/presentation/rocket/bloc/state.dart';
import 'package:spacex/presentation/shared/http_status.dart';

import '../../../repo/rocket_repo.dart';

class RocketBloc extends Bloc<RocketEvent, RocketState> {
  final RocketRepository _repo;
  final String _id;

  RocketBloc(this._repo, this._id) : super(const RocketState()) {
    on<LoadRocketEvent>((event, emit) async {
      emit(const RocketState(status: HttpRequestStatus.loading));
      try {
        final data = await _repo.getOne(_id);
        emit(RocketState(data: data, status: HttpRequestStatus.success));
      } catch (err) {
        emit(RocketState(
            error: err.toString(), status: HttpRequestStatus.failed));
      }
    });
  }
}
