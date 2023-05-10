import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/presentation/rocket/bloc/event.dart';
import 'package:spacex/presentation/rocket/bloc/state.dart';

import '../../../repo/rocket_repo.dart';

class RocketBloc extends Bloc<RocketEvent, RocketState> {
  final RocketRepository _repo;

  RocketBloc(this._repo) : super(RocketLoadingState()) {
    //
  }
}
