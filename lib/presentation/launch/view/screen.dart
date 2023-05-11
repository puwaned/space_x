import 'dart:async';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/presentation/launch/bloc/bloc.dart';
import 'package:spacex/presentation/launch/bloc/event.dart';

import '../../shared/http_status.dart';
import '../bloc/state.dart';
import 'drawer.dart';
import 'launch_list.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LaunchScreen> {
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
    launchBloc.add(LoadLaunchEvent(filter: launchBloc.state.filter));
  }

  _initSearchController() {
    _searchController = TextEditingController()
      ..addListener(() {
        var text = _searchController.text;
        _timer?.cancel();
        _timer = Timer(const Duration(milliseconds: 500), () {
          var launchBloc = context.read<LaunchBloc>();
          var filter = launchBloc.state.filter;
          //prevent fetch when first open text_field
          if (filter.search == text) return;
          var next = filter.copyWith(page: 1, search: text);
          launchBloc.add(LoadLaunchEvent(filter: next));
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
        endDrawer: const HomeDrawer(),
        backgroundColor: const Color(0xFF01051A),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF01051A),
          centerTitle: false,
          title: const Text('Space X'),
          actions: [
            AnimSearchBar(
              key: const Key('search_bar'),
              autoFocus: true,
              width: 320,
              rtl: true,
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
      switch (state.status) {
        case HttpRequestStatus.loading:
        case HttpRequestStatus.initial:
          return const Center(
            child: Hero(
                tag: 'splash_screen',
                child: CupertinoActivityIndicator(
                  color: Colors.white,
                )),
          );
        case HttpRequestStatus.success:
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: LaunchList(
              launch: state.data,
            ),
          );
        case HttpRequestStatus.failed:
          return Center(
            child: Text(state.error),
          );
      }
    }, listener: (context, state) {
      return;
    });
  }
}
