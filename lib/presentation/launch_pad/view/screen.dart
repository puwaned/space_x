import 'package:flutter/material.dart';

class LaunchPadScreen extends StatefulWidget {
  const LaunchPadScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LaunchPadScreen> {
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      backgroundColor: const Color(0xFF01051A),
      appBar: AppBar(
        title: const Text('Launch pad detail'),
        backgroundColor: const Color(0xFF01051A),
      ),
      body: LaunchPadBody(
        id: id,
      ),
    );
  }
}

class LaunchPadBody extends StatelessWidget {
  final String id;

  const LaunchPadBody({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
