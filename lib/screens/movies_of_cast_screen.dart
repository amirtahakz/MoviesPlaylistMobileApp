import 'package:flutter/material.dart';
import 'package:moviesplaylist/services/tmdb/movies.dart';
import 'package:moviesplaylist/utilities/styles.dart';
import 'package:moviesplaylist/widgets/movies_of_cast_grid.dart';


class MoviesOfCastScreen extends StatelessWidget {
  final int idCast;
  const MoviesOfCastScreen({Key? key, required this.idCast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromRGBO(0, 8, 63, 100), Color.fromRGBO(0, 43, 123, 100)])
      ),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25 ,top: 10),
              child: GestureDetector(
                child: Text('فیلم های این هنرمند' , style: pageTitleTextStyle,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                child: const Icon(Icons.arrow_forward_ios),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        body: FutureBuilder(
          future: getMoviesOfCast(idCast),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            if(snapshot.hasData){
              return MoviesOfCastGrid(items: snapshot.data);
            }else{
              return const Center(
                  child: CircularProgressIndicator()
              );
            }
          },
        ),
      ),
    );
  }
}



