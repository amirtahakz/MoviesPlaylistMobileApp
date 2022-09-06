import 'package:flutter/material.dart';
import 'package:moviesplaylist/services/tmdb/casts.dart';
import 'package:moviesplaylist/services/tmdb/movies.dart';
import 'package:moviesplaylist/widgets/cast_list_horizontal.dart';
import 'package:moviesplaylist/widgets/image_slider.dart';
import 'package:moviesplaylist/widgets/movie_list_horizontal.dart';
import '../Utilities/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FutureBuilder(
          future: getUpcomingMovies(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            if (snapshot.hasData) {
              return ImageSlider(
                movies: snapshot.data,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        FutureBuilder(
          future: getTrendingCasts(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: CastListHorizontal(
                  leftPadding: 15,
                  rightPadding: 15,
                  items: snapshot.data,
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 22, bottom: 8),
          child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                'به انتخاب مووی پلی لیست',
                style: titleHomeTextStyle,
                textAlign: TextAlign.end,
              )),
        ),
        FutureBuilder(
          future: getMoviesByGenres(18),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            if (snapshot.hasData) {
              return MovieListHorizontal(
                leftPadding: 15,
                rightPadding: 15,
                items: snapshot.data,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 22, bottom: 8, top: 8),
          child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                'علمی تخیلی',
                style: titleHomeTextStyle,
                textAlign: TextAlign.end,
              )),
        ),
        FutureBuilder(
          future: getMoviesByGenres(878),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            if (snapshot.hasData) {
              return MovieListHorizontal(
                leftPadding: 15,
                rightPadding: 15,
                items: snapshot.data,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 22, bottom: 8, top: 8),
          child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                'ترسناک',
                style: titleHomeTextStyle,
                textAlign: TextAlign.end,
              )),
        ),
        FutureBuilder(
          future: getMoviesByGenres(27),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            if (snapshot.hasData) {
              return MovieListHorizontal(
                leftPadding: 15,
                rightPadding: 15,
                items: snapshot.data,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 22, bottom: 8, top: 8),
          child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                'انیمیشن',
                style: titleHomeTextStyle,
                textAlign: TextAlign.end,
              )),
        ),
        FutureBuilder(
          future: getMoviesByGenres(16),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            if (snapshot.hasData) {
              return MovieListHorizontal(
                leftPadding: 15,
                rightPadding: 15,
                items: snapshot.data,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
