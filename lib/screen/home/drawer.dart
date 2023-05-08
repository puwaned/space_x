import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/bloc/launch/bloc.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var launchBloc = context.read<LaunchBloc>();

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(),
            const Text(
              'Name',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            ChipsChoice<int>.single(
              value: null,
              onChanged: (val) {
                //
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
            Divider(),
            const Text(
              'Fire date',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            ChipsChoice<int>.single(
              value: null,
              onChanged: (val) {
                //
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
        ),
      ),
    );
  }
}
