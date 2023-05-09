import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/model/launch_model.dart';

class LaunchCubit extends Cubit<LaunchFilter> {
  LaunchCubit() : super(LaunchFilter(page: 1, sortFireDate: 0, sortName: 0, search: ''));

  void change(LaunchFilter filter) {
    emit(filter);
  }
}
