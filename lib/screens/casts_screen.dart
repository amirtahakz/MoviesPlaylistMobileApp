import 'package:flutter/material.dart';
import 'package:moviesplaylist/services/tmdb/casts.dart';
import 'package:moviesplaylist/widgets/casts_grid.dart';

class CastsScreen extends StatelessWidget {
  const CastsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPopularCasts().then((value) => value.casts),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.hasData) {
          return CastsGrid(items: snapshot.data);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
