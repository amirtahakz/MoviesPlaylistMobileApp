import 'package:flutter/material.dart';
import 'package:moviesplaylist/services/tmdb/casts.dart';
import 'package:moviesplaylist/widgets/images_grid.dart';
import '../utilities/styles.dart';

class ImagesOfCastScreen extends StatelessWidget {
  final int idCast;

  const ImagesOfCastScreen({Key? key, required this.idCast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getImagesOfCast(idCast),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.hasData) {
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
                    padding: const EdgeInsets.only(right: 35, top: 10),
                    child: GestureDetector(
                      child: Text(
                        'عکس های این هنرمند',
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
              body: ImagesGrid(
                items: snapshot.data,
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
