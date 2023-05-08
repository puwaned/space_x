import 'dart:async';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/bloc/launch/bloc.dart';
import 'package:spacex/bloc/launch/event.dart';
import 'package:spacex/bloc/launch/state.dart';
import 'package:spacex/screen/home/drawer.dart';

import 'launch_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<HomeScreen> {
  late final TextEditingController _searchController;
  Timer? _timer;

  _onSearch(String value) {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 500), () {
      var launchBloc = context.read<LaunchBloc>();
      launchBloc.add(SearchLaunchEvent(value));
    });
  }

  @override
  void initState() {
    super.initState();
    _initLaunch();
    _initSearchController();
  }

  _initLaunch() {
    var launchBloc = context.read<LaunchBloc>();
    launchBloc.add(LoadLaunchEvent());
  }

  _initSearchController() {
    var launchBloc = context.read<LaunchBloc>();
    _searchController = TextEditingController()
      ..addListener(() {
        var text = _searchController.text;
        _timer?.cancel();
        _timer = Timer(const Duration(milliseconds: 500), () {
          // launchBloc.add(SearchLaunchEvent(text));
        });
      });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerEnableOpenDragGesture: false,
        endDrawer: HomeDrawer(),
        backgroundColor: const Color(0xFF01051A),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF01051A),
          centerTitle: false,
          title: const Text('Space X'),
          actions: [
            AnimSearchBar(
              width: 320,
              textController: _searchController,
              onSuffixTap: () {
                //
              },
              onSubmitted: (_) {
                //
              },
            ),
            Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(Icons.sort));
            })
          ],
        ),
        body: _body());
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
