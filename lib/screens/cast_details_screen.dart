import 'package:flutter/material.dart';
import 'package:moviesplaylist/models/cast.dart';
import 'package:moviesplaylist/screens/images_of_cast_screen.dart';
import 'package:moviesplaylist/screens/series_of_cast_screen.dart';
import 'package:moviesplaylist/services/tmdb/casts.dart';
import '../Widgets/profile_card.dart';
import '../Utilities/styles.dart';
import 'movies_of_cast_screen.dart';

class CastDetailsScreen extends StatelessWidget {
  final int idCast;

  const CastDetailsScreen({
    Key? key,
    required this.idCast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cast cast;
    return FutureBuilder(
      future: getDetailsCast(idCast),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.hasData) {
          cast = snapshot.data;
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
                    padding: const EdgeInsets.only(right: 28, top: 10),
                    child: GestureDetector(
                      child: const Text(
                        'اطلاعات این هنرمند',
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
                  ProfileCard(
                    profile_path: cast.profile_path.toString(),
                    name: cast.name.toString(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          // height: 75,
                          // minWidth: 75,
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MoviesOfCastScreen(
                                          idCast: idCast,
                                        )))
                          },
                          child: Column(
                            children: const [
                              Icon(
                                Icons.video_collection,
                                color: Colors.white,
                                size: 35,
                              ),
                              Text(
                                'فیلم',
                                style: movieDetailsButtonsTextStyle,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          // height: 75,
                          // minWidth: 75,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SeriesOfCastScreen(idCast: idCast)));
                          },
                          child: Column(
                            children: const [
                              Icon(
                                Icons.videocam,
                                color: Colors.white,
                                size: 35,
                              ),
                              Text(
                                'سریال',
                                style: movieDetailsButtonsTextStyle,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          // height: 75,
                          // minWidth: 75,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ImagesOfCastScreen(idCast: idCast)));
                          },
                          child: Column(
                            children: const [
                              Icon(
                                Icons.photo_library_rounded,
                                color: Colors.white,
                                size: 35,
                              ),
                              Text(
                                'عکس',
                                style: movieDetailsButtonsTextStyle,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          // height: 75,
                          // minWidth: 75,
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
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Divider(
                      height: 4,
                      color: Colors.white,
                      thickness: 0.75,
                      indent: 19,
                      endIndent: 19,
                    ),
                  ),
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
                    child: Row(
                      children: [
                        const Text(
                          'Birthday : ',
                          style: titleTitleMovieDetailsTextStyle,
                        ),
                        Text(
                          cast.birthday.toString(),
                          style: movieDetailsTextStyle,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 19, top: 7, bottom: 7, right: 19),
                    child: Row(
                      children: [
                        const Text(
                          'Deathday : ',
                          style: titleTitleMovieDetailsTextStyle,
                        ),
                        Text(
                          cast.deathday == null
                              ? 'Live'
                              : cast.deathday.toString(),
                          style: movieDetailsTextStyle,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 19, top: 7, bottom: 7, right: 19),
                    child: Row(
                      children: [
                        const Text(
                          'Gender : ',
                          style: titleTitleMovieDetailsTextStyle,
                        ),
                        Text(
                          cast.gender == 1 ? 'Female' : 'male',
                          style: movieDetailsTextStyle,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 19, top: 7, bottom: 7, right: 19),
                    child: Row(
                      children: [
                        const Text(
                          'Known For Department : ',
                          style: titleTitleMovieDetailsTextStyle,
                        ),
                        Text(
                          cast.known_for_department.toString(),
                          style: movieDetailsTextStyle,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 19, top: 7, bottom: 7, right: 19),
                    child: FittedBox(
                      child: Row(
                        children: [
                          const Text(
                            'Place Of Birth :',
                            style: titleTitleMovieDetailsTextStyle,
                          ),
                          Text(
                            cast.place_of_birth.toString(),
                            style: movieDetailsTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Divider(
                      height: 4,
                      color: Colors.white,
                      thickness: 0.75,
                      indent: 19,
                      endIndent: 19,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 19, top: 7, bottom: 7),
                    child: Text(
                      'Biography',
                      style: titleMovieDetailsTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 19, top: 7, bottom: 7, right: 19),
                    child: Text(
                      cast.biography.toString(),
                      style: movieDetailsTextStyle,
                    ),
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
