import 'package:moviesplaylist/models/movie.dart';

class MovieData {
  final List<Movie> movies;
  final int? total_pages;

  MovieData({
    required this.movies,
    this.total_pages,
  });

  factory MovieData.fromJson(Map<String, dynamic> json) {
    final List<Movie> dataTemp = [];
    if (json['results'] != null) {
      for(var item in json['results']){
        dataTemp.add(Movie.fromJson(item as Map<String, dynamic>));
      }
    }
    if (json['cast'] != null) {
      for(var item in json['cast']){
        dataTemp.add(Movie.fromJson(item as Map<String, dynamic>));
      }
    }
    return MovieData(
      movies: dataTemp,
      total_pages: json['total_pages'],
    );
  }
}
