import 'package:flutter/material.dart';
import 'package:moviesplaylist/models/cast.dart';
import 'package:moviesplaylist/Widgets/cast_card.dart';

class CastListHorizontal extends StatelessWidget {
  final double leftPadding;
  final double rightPadding;
  final List<Cast> items;

  const CastListHorizontal({
    Key? key,
    required this.leftPadding,
    required this.rightPadding,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        reverse: true,
        padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
        itemCount: items.length,
        cacheExtent: 100,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 0, right: 0),
            child: CastCard(
              id: items[index].id,
              name: items[index].name,
              profile_path: items[index].profile_path,
            ),
          );
        },
      ),
    );
  }
}
