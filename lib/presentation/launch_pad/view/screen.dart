import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/presentation/launch_pad/bloc/bloc.dart';
import 'package:spacex/presentation/launch_pad/bloc/event.dart';
import 'package:spacex/presentation/launch_pad/bloc/state.dart';
import 'package:spacex/presentation/shared/gallery.dart';

import '../../../model/launch_pad_model.dart';
import '../../shared/http_status.dart';

class LaunchPadScreen extends StatefulWidget {
  const LaunchPadScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LaunchPadScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initLoadEvent();
    });
  }

  _initLoadEvent() {
    context.read<LaunchPadBloc>().add(const LoadLaunchPadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF01051A),
      appBar: AppBar(
        title: const Text('Launch pad detail'),
        backgroundColor: const Color(0xFF01051A),
      ),
      body:
          BlocBuilder<LaunchPadBloc, LaunchPadState>(builder: (context, state) {
        switch (state.status) {
          case HttpRequestStatus.initial:
          case HttpRequestStatus.loading:
            return const Center(
              child: CupertinoActivityIndicator(
                color: Colors.white,
              ),
            );
          case HttpRequestStatus.failed:
            return Center(
              child: Text(state.error),
            );
          case HttpRequestStatus.success:
            return LaunchPadDetail(
              data: state.data!,
            );
        }
      }),
    );
  }
}

class LaunchPadDetail extends StatelessWidget {
  final LaunchPadModel data;
  const LaunchPadDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              data.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              data.fullName,
              textAlign: TextAlign.center,
            ),
            _buildDetail(data.details),
            const SizedBox(
              height: 20,
            ),
            ImageGallery(
              images: data.images,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: _buildCardWithText(
                      label: 'Launch attempts', count: data.launchAttempt),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: _buildCardWithText(
                      label: 'Launch successes', count: data.launchSuccess),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildDetail(String? details) {
    if (details == null) return Container();
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10)),
      child: Text(data.details ?? ''),
    );
  }

  _buildCardWithText({required String label, int? count}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${count ?? '-'}',
            style: const TextStyle(fontSize: 40),
          )
        ],
      ),
    );
  }
}
