import 'package:moviesplaylist/models/genre.dart';

class Movie {
  final int id;
  final String title;
  final String release_date;
  final String poster_path;
  final String? backdrop_path;

  final String? original_title;
  final String? overview;
  final String? original_language;
  final String? imdb_id;
  final String? vote_average;
  final int? vote_count;
  final int? runtime;
  final List<Genre>? genres;

  Movie({
    required this.id,
    required this.title,
    required this.release_date,
    required this.poster_path,
    this.backdrop_path,

    this.genres,
    this.original_title,
    this.imdb_id,
    this.overview,
    this.original_language,
    this.runtime,
    this.vote_average,
    this.vote_count,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    final List<Genre> dataTemp = [];
    if (json['genres'] != null) {
      for (var item in json['genres']) {
        dataTemp.add(Genre.fromJson(item as Map<String, dynamic>));
      }
    }
    return Movie(
      id: json['id'],
      poster_path: json['poster_path'] ?? '',
      release_date: json['release_date'] ?? '',
      title: json['title'],
      backdrop_path: json['backdrop_path'],

      genres: dataTemp,
      original_title: json['original_title'],
      imdb_id: json['imdb_id'],
      original_language: json['original_language'],
      overview: json['overview'],
      runtime: json['runtime'],
      vote_count: json['vote_count'],
      vote_average: json['vote_average'].toString(),
    );
  }
}
