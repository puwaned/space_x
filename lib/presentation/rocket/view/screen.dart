import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/model/rocket_model.dart';
import 'package:spacex/presentation/rocket/bloc/bloc.dart';
import 'package:spacex/presentation/rocket/bloc/event.dart';
import 'package:spacex/presentation/rocket/bloc/state.dart';
import 'package:spacex/presentation/shared/gallery.dart';

class RocketDetailScreen extends StatefulWidget {
  const RocketDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<RocketDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initLoadEvent();
    });
  }

  _initLoadEvent() {
    var id = ModalRoute.of(context)?.settings.arguments as String;
    context.read<RocketBloc>().add(LoadRocketEvent(id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF01051A),
      appBar: AppBar(
        title: const Text(
          'Rocket Details',
        ),
        backgroundColor: const Color(0xFF01051A),
      ),
      body: BlocBuilder<RocketBloc, RocketState>(builder: (context, state) {
        if (state is RocketLoadingState) {
          return const Center(
            child: CupertinoActivityIndicator(
              color: Colors.white,
            ),
          );
        }
        if (state is RocketErrorState) {
          return Center(
            child: Text(state.error),
          );
        }

        if (state is RocketLoadedState) {
          return RocketDetail(
            data: state.data,
          );
        }

        return Container();
      }),
    );
  }
}

class RocketDetail extends StatelessWidget {
  final RocketModel data;

  const RocketDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              data.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildTextRecord(label: 'Country', value: data.country),
            _buildTextRecord(label: 'Height', value: '${data.height.meters} m'),
            _buildTextRecord(label: 'Mass', value: '${data.mass.kg} kg'),
            _buildTextRecord(label: 'Landing legs', value: '${data.landingLeg.number}'),
            _buildPayload(payload: data.payloadWeights),
            ImageGallery(images: data.images)
          ],
        ),
      ),
    );
  }

  _buildPayload({required List<RocketPayloadWeightModel> payload}) {
    if (payload.isEmpty) return Container();

    return Column(
      children: [
        Divider(
          color: Colors.white.withOpacity(0.5),
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 1, child: Text('Payload')),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: payload.asMap().entries.map((e) {
                    var index = e.key;
                    var value = e.value;
                    return Container(
                      margin: EdgeInsets.only(
                          bottom: index == payload.length - 1 ? 0 : 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(value.name),
                    );
                  }).toList(),
                )),
          ],
        ),
        Divider(
          color: Colors.white.withOpacity(0.5),
          height: 30,
        ),
      ],
    );
  }

  _buildTextRecord({
    required String label,
    String? value,
  }) {
    return Column(
      children: [
        Divider(
          color: Colors.white.withOpacity(0.5),
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: Text(label)),
            const SizedBox(
              width: 10,
            ),
            Expanded(flex: 2, child: Text(value ?? '-')),
          ],
        )
      ],
    );
  }
}
