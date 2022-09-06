import 'package:flutter/material.dart';
import 'package:moviesplaylist/models/movie.dart';
import 'package:moviesplaylist/services/tmdb/movies.dart';
import 'movie_card.dart';

class MoviesGrid extends StatefulWidget {
  final List<Movie> items;

  const MoviesGrid({Key? key, required this.items})
      : super(key: key);

  @override
  _MoviesGridState createState() => _MoviesGridState();
}

class _MoviesGridState extends State<MoviesGrid> {
  int currentPage = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: (50 / 75),
            crossAxisSpacing: 3,
            mainAxisSpacing: 9,
          ),
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: MovieCard(
                    id: widget.items[index].id,
                    poster_path: widget.items[index].poster_path,
                    title: widget.items[index].title,
                    Date: widget.items[index].release_date
                ));
          }),
    );
  }

  getMoreData() async {
    currentPage += 1;
    var moreItems = getMorePopularMovies(currentPage);
    setState(() {
      moreItems.then((value) {
        widget.items.addAll(value);
      });
    });
  }
}
