import 'package:flutter/material.dart';
import 'package:moviesplaylist/models/movie.dart';
import 'movie_card.dart';


class MoviesOfCastGrid extends StatelessWidget {
  final List<Movie> items;
  const MoviesOfCastGrid({Key? key, required this.items}) : super(key: key);

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
                child: MovieCard(
                    id: items[index].id,
                    poster_path: items[index].poster_path,
                    title: items[index].title,
                    Date: items[index].release_date
                ));
          }),
    );
  }
}

