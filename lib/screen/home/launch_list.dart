import 'package:flutter/material.dart';
import 'package:spacex/model/launch_model.dart';
import 'package:spacex/model/share_model.dart';

class LaunchList extends StatefulWidget {
  final PaginationModel<LaunchModel> launch;
  const LaunchList({super.key, required this.launch});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LaunchList> {
  PaginationModel<LaunchModel> get launch => widget.launch;

  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var list = launch.docs;
    return ListView.separated(
        controller: _controller,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemBuilder: (context, index) {
          var item = list[index];
          return Row(
            children: [
              SizedBox(
                width: 20,
                child: Text('${index + 1}'),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(child: Text(item.name)),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                item.details,
                maxLines: 3,
                style: TextStyle(overflow: TextOverflow.ellipsis),
              ))
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: list.length);
  }
}
