import 'package:flutter/material.dart';
import 'package:moviesplaylist/services/tmdb/movies.dart';
import 'package:moviesplaylist/widgets/movies_grid.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPopularMovies().then((value) => value.movies),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.hasData) {
          return MoviesGrid(items: snapshot.data);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
