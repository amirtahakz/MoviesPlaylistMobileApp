import 'package:flutter/material.dart';
import 'package:moviesplaylist/models/movie.dart';
import 'package:moviesplaylist/widgets/movie_card.dart';

class MovieListHorizontal extends StatelessWidget {
  final double leftPadding;
  final double rightPadding;
  final List<Movie> items;

  const MovieListHorizontal({
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
        padding: EdgeInsets.only(
            left: leftPadding, right: rightPadding),
        cacheExtent: 100,
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: MovieCard(
              id: items[index].id,
              poster_path: items[index].poster_path,
              title: items[index].title,
              Date: items[index].release_date,
            ),
          );
        },
      ),
    );
  }
}

