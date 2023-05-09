import 'dart:async';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/launch/bloc/bloc.dart';
import 'package:spacex/launch/bloc/event.dart';
import 'package:spacex/launch/cubit/cubit.dart';
import 'package:spacex/model/launch_model.dart';

import '../bloc/state.dart';
import 'drawer.dart';
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

  @override
  void initState() {
    super.initState();
    _initLaunch();
    _initSearchController();
  }

  _initLaunch() {
    var launchBloc = context.read<LaunchBloc>();
    var launchCubit = context.read<LaunchCubit>();
    launchBloc.add(LoadLaunchEvent(LaunchFilter(page: launchCubit.state.page)));
  }

  _initSearchController() {
    var launchBloc = context.read<LaunchBloc>();
    var launchCubit = context.read<LaunchCubit>();
    _searchController = TextEditingController()
      ..addListener(() {
        var text = _searchController.text;
        _timer?.cancel();
        _timer = Timer(const Duration(milliseconds: 500), () {
          launchBloc.add(LoadLaunchEvent(LaunchFilter(
              page: launchCubit.state.page,
              search: text,
              sortName: launchCubit.state.sortName,
              sortFireDate: launchCubit.state.sortFireDate)));
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
              autoFocus: true,
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
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: LaunchList(
            launch: state.data,
          ),
        );
      }

      return Container();
    }, listener: (context, state) {
      if (state is LaunchLoadMoreErrorState) {
        final snackBar = SnackBar(
          content: Text(state.error),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      return;
    });
  }
}
