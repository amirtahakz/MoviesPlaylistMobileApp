import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesplaylist/models/serial.dart';

import 'serial_card.dart';

class SerialListHorizontal extends StatelessWidget {
  final double leftPadding;
  final double rightPadding;
  final List<Serial> items;

  const SerialListHorizontal({
    Key? key,
    required this.leftPadding,
    required this.rightPadding,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        reverse: true,
        itemCount: items.length,
        padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
        cacheExtent: 100,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: SerialCard(
              id: items[index].id,
              poster_path: items[index].poster_path.toString(),
              title: items[index].name,
              Date: items[index].first_air_date,
            ),
          );
        },
      ),
    );
  }
}
