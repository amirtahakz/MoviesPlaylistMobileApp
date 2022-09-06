import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:moviesplaylist/screens/movie_details_screen.dart';
import '../Utilities/styles.dart';

class MovieCard extends StatefulWidget {
  final int id;
  final String poster_path, title, Date;

  const MovieCard({
    Key? key,
    required this.id,
    required this.poster_path,
    required this.title,
    required this.Date,
  }) : super(key: key);

  @override
  _MovieCard createState() => _MovieCard();
}

class _MovieCard extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(
                      idMovie: widget.id,
                    )));
      },
      child: Container(
        height: 160,
        width: 95,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: widget.poster_path.isEmpty
                  ? Image.asset('assets/images/moviePosterError.png')
                  : Image.network(
                      'https://image.tmdb.org/t/p/w500' + widget.poster_path,
                      loadingBuilder: (context, child, progress) {
                        return progress == null
                            ? child
                            : const CircularProgressIndicator(
                                color: Colors.white,
                              );
                      },
                    ),
            ),
            const Divider(height: 8),
            Text(
              widget.title,
              style: movieCardTextStyle,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
