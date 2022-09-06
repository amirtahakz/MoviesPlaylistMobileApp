import 'genre.dart';

class Serial {
  final int id;
  final String name;
  final String first_air_date;
  final String poster_path;

  final String? overview;
  final String? original_language;
  final String? vote_average;
  final int? vote_count;
  var imdb_id;
  final List<int>? episode_run_time;
  final List<Genre>? genres;

  Serial({
    required this.id,
    required this.name,
    required this.poster_path,
    required this.first_air_date,

    this.vote_count,
    this.vote_average,
    this.original_language,
    this.overview,
    this.imdb_id,
    this.episode_run_time,
    this.genres,
  });

  factory Serial.fromJson(Map<String, dynamic> json) {
    final List<Genre> dataTemp = [];
    final List<int> dataTemp2 = [];
    if (json['genres'] != null) {
      for (var item in json['genres']) {
        dataTemp.add(Genre.fromJson(item as Map<String, dynamic>));
      }
      for (var item in json['episode_run_time']) {
        dataTemp2.add(item);
      }
    }
    return Serial(
      id: json['id'],
      name: json['name'] ?? '',
      poster_path: json['poster_path'] ?? '',
      first_air_date: json['first_air_date'] ?? '',

      overview: json['overview'] ?? '',
      original_language: json['original_language'] ?? '',
      imdb_id: json['imdb_id'] ?? '',
      vote_count: json['vote_count'],
      vote_average: json['vote_average'].toString(),
      episode_run_time: dataTemp2,
      genres: dataTemp,
    );
  }
}
