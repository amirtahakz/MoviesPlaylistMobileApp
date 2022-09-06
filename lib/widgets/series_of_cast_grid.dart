import 'package:flutter/material.dart';
import 'package:moviesplaylist/models/serial.dart';
import 'package:moviesplaylist/widgets/serial_card.dart';

class SeriesOfCastGrid extends StatelessWidget {
  final List<Serial> items;

  const SeriesOfCastGrid({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: (50 / 75),
            crossAxisSpacing: 3,
            mainAxisSpacing: 9,
          ),
          itemCount: items.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: SerialCard(
                    id: items[index].id,
                    poster_path: items[index].poster_path.toString(),
                    title: items[index].name,
                    Date: items[index].first_air_date));
          }),
    );
  }
}
