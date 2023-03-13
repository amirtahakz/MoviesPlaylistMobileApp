import 'package:flutter/material.dart';
import 'package:moviesplaylist/models/movie.dart';
import 'package:moviesplaylist/screens/image_screen.dart';
import 'package:moviesplaylist/services/ava_movie/movies.dart';
import 'package:moviesplaylist/services/tmdb/casts.dart';
import 'package:moviesplaylist/services/tmdb/movies.dart';
import 'package:moviesplaylist/widgets/cast_list_horizontal.dart';
import 'package:moviesplaylist/widgets/movie_list_horizontal.dart';
import 'package:moviesplaylist/widgets/video_player.dart';

import '../Utilities/styles.dart';
import 'package:video_player/video_player.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int idMovie;

  const MovieDetailsScreen({
    Key? key,
    required this.idMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Movie movie;
    return FutureBuilder(
      future: getDetailsMovie(idMovie),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.hasData) {
          movie = snapshot.data;
          return Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromRGBO(0, 8, 63, 100),
                  Color.fromRGBO(0, 43, 123, 100)
                ])),
            child: Scaffold(
              extendBody: true,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 10),
                    child: GestureDetector(
                      child: const Text(
                        'اطلاعات فیلم',
                        style: pageTitleTextStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      child: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              body: ListView(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 19, right: 15),
                        child: GestureDetector(
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: movie.poster_path.isEmpty
                                ? Image.asset(
                                    'assets/images/moviePosterError.png',
                                    width: 220,
                                    height: 320)
                                : Image.network(
                                    'https://image.tmdb.org/t/p/w500' +
                                        movie.poster_path,
                                    width: 220,
                                    height: 330,
                                  ),
                          ),
                          onTap: () => {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return ImageScreen(
                                  imagePath: 'https://image.tmdb.org/t/p/w500' +
                                      movie.poster_path);
                            }))
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextButton(
                                // height: 90,
                                // minWidth: 90,
                                onPressed: () {
                                  // getLinksMovie();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VideoWidget(
                                          videoPlayerController:
                                          VideoPlayerController.network(
                                            'https://dl6.sgegrv8ergs4sd555dsfa6bv8ajfg545.xyz/user/Movies/1400/10/The.Matrix.Resurrections.2021/SoftSub/The.Matrix.Resurrections.2021.720p.WEB-DL.x264-Pahe.SoftSub.AvaMovie.mkv',
                                          ),
                                        ),
                                      ));
                                },
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.videocam,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    Text(
                                      'تماشا',
                                      style: movieDetailsButtonsTextStyle,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const Divider(
                              height: 14,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextButton(
                                // height: 90,
                                // minWidth: 90,
                                onPressed: () {},
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    Text(
                                      movie.vote_average.toString(),
                                      style: movieDetailsButtonsTextStyle,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const Divider(
                              height: 14,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextButton(
                                // height: 90,
                                // minWidth: 90,
                                onPressed: () {},
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    Text(
                                      'اضافه',
                                      style: movieDetailsButtonsTextStyle,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 19, top: 10, bottom: 7),
                    child: Text(
                      movie.title + '  ' + movie.release_date,
                      style: titleMovieDetailsTextStyle,
                    ),
                  ),
                  const Divider(
                    height: 4,
                    color: Colors.white,
                    thickness: 0.75,
                    indent: 19,
                    endIndent: 19,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 19, top: 7, bottom: 7),
                    child: Text(
                      'Summery',
                      style: titleMovieDetailsTextStyle,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 19, bottom: 7, right: 19),
                    child: Text(
                      movie.overview!,
                      style: movieDetailsTextStyle,
                    ),
                  ),
                  const Divider(
                      height: 4,
                      color: Colors.white,
                      thickness: 0.75,
                      indent: 19,
                      endIndent: 19),
                  const Padding(
                    padding: EdgeInsets.only(left: 19, top: 7, bottom: 7),
                    child: Text(
                      'Information',
                      style: titleMovieDetailsTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 19, top: 7, bottom: 7, right: 19),
                    child: FittedBox(
                      child: Row(
                        children: [
                          const Text(
                            'Genres : ',
                            style: titleTitleMovieDetailsTextStyle,
                          ),
                          Row(
                            children: movie.genres!
                                .map((e) => Text(
                                      e.name,
                                      style: movieDetailsTextStyle,
                                      softWrap: true,
                                    ))
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19, top: 7, bottom: 7),
                    child: Row(
                      children: [
                        const Text(
                          'Length : ',
                          style: titleTitleMovieDetailsTextStyle,
                        ),
                        Text(
                          movie.runtime.toString() + 'min',
                          style: movieDetailsTextStyle,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19, top: 7, bottom: 7),
                    child: Row(
                      children: [
                        const Text(
                          'Vote Count : ',
                          style: titleTitleMovieDetailsTextStyle,
                        ),
                        Text(
                          movie.vote_count.toString(),
                          style: movieDetailsTextStyle,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19, top: 7, bottom: 7),
                    child: Row(
                      children: [
                        const Text(
                          'Original Language : ',
                          style: titleTitleMovieDetailsTextStyle,
                        ),
                        Text(
                          movie.original_language!,
                          style: movieDetailsTextStyle,
                        )
                      ],
                    ),
                  ),
                  const Divider(
                      height: 4,
                      color: Colors.white,
                      thickness: 0.75,
                      indent: 19,
                      endIndent: 19),
                  const Padding(
                    padding: EdgeInsets.only(left: 19, top: 7, bottom: 7),
                    child: Text(
                      'Casts',
                      style: titleMovieDetailsTextStyle,
                    ),
                  ),
                  FutureBuilder(
                    future: getCastsOfMovie(idMovie),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 19, top: 7, bottom: 7, right: 17),
                          child: CastListHorizontal(
                            leftPadding: 0,
                            rightPadding: 0,
                            items: snapshot.data,
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  const Divider(
                      height: 4,
                      color: Colors.white,
                      thickness: 0.75,
                      indent: 19,
                      endIndent: 19),
                  const Padding(
                    padding: EdgeInsets.only(left: 19, top: 7, bottom: 7),
                    child: Text(
                      'Suggested Movies',
                      style: titleMovieDetailsTextStyle,
                    ),
                  ),
                  FutureBuilder(
                    future: getSuggestedMovie(idMovie),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 19, top: 7, bottom: 7, right: 17),
                          child: MovieListHorizontal(
                            leftPadding: 0,
                            rightPadding: 0,
                            items: snapshot.data,
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
