import 'package:flutter/material.dart';
import 'package:moviesplaylist/models/serial.dart';
import 'package:moviesplaylist/services/tmdb/casts.dart';
import 'package:moviesplaylist/services/tmdb/series.dart';
import 'package:moviesplaylist/widgets/cast_list_horizontal.dart';
import 'package:moviesplaylist/widgets/serial_list_horizontal.dart';
import '../utilities/styles.dart';
import 'image_screen.dart';

class SerialDtailsScreen extends StatelessWidget {
  final int idSerial;

  const SerialDtailsScreen({
    Key? key,
    required this.idSerial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Serial serial;
    return FutureBuilder(
      future: getDetailsSerial(idSerial),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.hasData) {
          serial = snapshot.data;
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
                    padding: const EdgeInsets.only(right: 15, top: 10),
                    child: GestureDetector(
                      child: Text(
                        'اطلاعات سریال',
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
                            child: serial.poster_path.isEmpty
                                ? Image.asset(
                                    'assets/images/moviePosterError.png',
                                    width: 220,
                                    height: 330)
                                : Image.network(
                                    'https://image.tmdb.org/t/p/w500' +
                                        serial.poster_path,
                                    width: 220,
                                    height: 330),
                          ),
                          onTap: () => {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return ImageScreen(
                                  imagePath: 'https://image.tmdb.org/t/p/w500' +
                                      serial.poster_path);
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
                              child: FlatButton(
                                height: 90,
                                minWidth: 90,
                                onPressed: () {},
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.videocam,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    Text(
                                      'تریلر',
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
                              child: FlatButton(
                                height: 90,
                                minWidth: 90,
                                onPressed: () {},
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    Text(
                                      serial.vote_average.toString(),
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
                              child: FlatButton(
                                height: 90,
                                minWidth: 90,
                                onPressed: () {},
                                child: Column(
                                  children: [
                                    const Icon(
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
                      serial.name,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 19, top: 7, bottom: 7),
                    child: Text(
                      'Summery',
                      style: titleMovieDetailsTextStyle,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 19, bottom: 7, right: 19),
                    child: Text(
                      serial.overview!,
                      style: movieDetailsTextStyle,
                    ),
                  ),
                  const Divider(
                      height: 4,
                      color: Colors.white,
                      thickness: 0.75,
                      indent: 19,
                      endIndent: 19),
                  Padding(
                    padding: const EdgeInsets.only(left: 19, top: 7, bottom: 7),
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
                          Text(
                            'Genres : ',
                            style: titleTitleMovieDetailsTextStyle,
                            maxLines: 1,
                          ),
                          Row(
                            children: serial.genres!
                                .map((e) => Text(
                                      e.name + ' ',
                                      style: movieDetailsTextStyle,
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
                        Text(
                          'Length : ',
                          style: titleTitleMovieDetailsTextStyle,
                        ),
                        Row(
                          children: serial.episode_run_time!
                              .map((e) => Text(
                                    e.toString() + 'min ',
                                    style: movieDetailsTextStyle,
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19, top: 7, bottom: 7),
                    child: Row(
                      children: [
                        Text(
                          'Vote Count : ',
                          style: titleTitleMovieDetailsTextStyle,
                        ),
                        Text(
                          serial.vote_count.toString(),
                          style: movieDetailsTextStyle,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19, top: 7, bottom: 7),
                    child: Row(
                      children: [
                        Text(
                          'Original Language : ',
                          style: titleTitleMovieDetailsTextStyle,
                        ),
                        Text(
                          serial.original_language!,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 19, top: 7, bottom: 7),
                    child: Text(
                      'Casts',
                      style: titleMovieDetailsTextStyle,
                    ),
                  ),
                  FutureBuilder(
                    future: getCastsOfSerial(idSerial),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 19, top: 7, bottom: 7),
                    child: Text(
                      'Suggested Series',
                      style: titleMovieDetailsTextStyle,
                    ),
                  ),
                  FutureBuilder(
                    future: getSuggestedSerial(idSerial),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 19, top: 7, bottom: 7, right: 17),
                          child: SerialListHorizontal(
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
