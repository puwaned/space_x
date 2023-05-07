import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/bloc/launch/bloc.dart';
import 'package:spacex/bloc/launch/event.dart';
import 'package:spacex/bloc/launch/state.dart';
import 'package:spacex/repo/launch_repo.dart';

import 'launch_list.dart';

class HomeScreen extends  StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }

}

class _State extends State<HomeScreen> {
  final _launchBloc = LaunchBloc(LaunchRepository());
  Timer? _timer;

  _onSearch(String value) {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 500), () {
      _launchBloc.add(SearchLaunchEvent(value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LaunchBloc>(
              create: (context) => _launchBloc..add(LoadLaunchEvent()))
        ],
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                TextField(
                  onChanged: _onSearch,
                ),
                Expanded(child: _body())
              ],
            ),
          ),
        ));
  }

  _body() {
    return BlocConsumer<LaunchBloc, LaunchState>(builder: (context, state) {
      if (state is LaunchLoadingState) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }
      if (state is LaunchErrorState) {
        return Center(
          child: Text(state.error),
        );
      }
      if (state is LaunchLoadedState) {
        return LaunchList(
          launch: state.data,
        );
      }

      return Container();
    }, listener: (context, state) {
      return;
    });
  }
}
