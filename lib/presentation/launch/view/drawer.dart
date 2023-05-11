import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/presentation/launch/bloc/bloc.dart';
import 'package:spacex/presentation/launch/bloc/event.dart';
import 'package:spacex/presentation/launch/bloc/state.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<LaunchBloc, LaunchState>(
          builder: (context, state) {
            var filter = state.filter;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(),
                const Text(
                  'Name',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                ChipsChoice<int>.single(
                  value: filter.sortName,
                  onChanged: (val) {
                    var next = filter.copyWith(page: 1, sortName: val);
                    context.read<LaunchBloc>().add(LoadLaunchEvent(filter: next));
                  },
                  choiceItems: C2Choice.listFrom<int, String>(
                    source: ['Ascending order', 'Descending order'],
                    value: (i, v) => i,
                    label: (i, v) => v,
                    tooltip: (i, v) => v,
                  ),
                  choiceCheckmark: true,
                  choiceStyle: C2ChipStyle.filled(
                    selectedStyle: const C2ChipStyle(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                  ),
                ),
                const Divider(),
                const Text(
                  'Fire date',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                ChipsChoice<int>.single(
                  value: filter.sortFireDate,
                  onChanged: (val) {
                    var next = filter.copyWith(page: 1, sortFireDate: val);
                    context.read<LaunchBloc>().add(LoadLaunchEvent(filter: next));
                  },
                  choiceItems: C2Choice.listFrom<int, String>(
                    source: ['Ascending order', 'Descending order'],
                    value: (i, v) => i,
                    label: (i, v) => v,
                    tooltip: (i, v) => v,
                  ),
                  choiceCheckmark: true,
                  choiceStyle: C2ChipStyle.filled(
                    selectedStyle: const C2ChipStyle(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
