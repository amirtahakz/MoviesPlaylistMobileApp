import 'package:flutter/material.dart';
import 'package:moviesplaylist/services/tmdb/series.dart';
import 'package:moviesplaylist/widgets/series_grid.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPopularSeries().then((value) => value.series),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.hasData) {
          return SeriesGrid(items: snapshot.data);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
    ;
  }
}
