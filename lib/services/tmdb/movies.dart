import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:moviesplaylist/models/movie.dart';
import 'package:moviesplaylist/models/movie_data.dart';

String MAIN_URL = 'https://api.themoviedb.org/3';
String API_KEY = '?api_key=16d9cee9ebd27d83a92eb4ef14b45c8c';

Future<List<Movie>> getMoviesByGenres(int idGenre) async {
  final String url =
      '$MAIN_URL/discover/movie$API_KEY&with_genres=$idGenre&page=1';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = MovieData.fromJson(responseDecoded);
    return item.movies;
  }
  throw Exception('Something Is Wrong');
}

Future<List<Movie>> getSuggestedMovie(int idMovie) async {
  final String url = '$MAIN_URL/movie/$idMovie/recommendations$API_KEY';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = MovieData.fromJson(responseDecoded);
    return item.movies;
  }
  throw Exception('Something Is Wrong');
}

Future<MovieData> getPopularMovies() async {
  final String url = '$MAIN_URL/movie/popular$API_KEY&page=1';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = MovieData.fromJson(responseDecoded);
    return item;
  }
  throw Exception('Something Is Wrong');
}

Future<List<Movie>> getMorePopularMovies(int pageNum) async {
  final String url = '$MAIN_URL/movie/popular$API_KEY&page=$pageNum';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = MovieData.fromJson(responseDecoded);
    return item.movies;
  }
  throw Exception('Something Is Wrong');
}

Future<Movie> getDetailsMovie(int idMovie) async {
  final String url = '$MAIN_URL/movie/$idMovie$API_KEY';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = Movie.fromJson(responseDecoded);
    return item;
  }
  throw Exception('Something Is Wrong');
}

Future<List<Movie>> getUpcomingMovies() async {
  final String url = '$MAIN_URL/movie/upcoming$API_KEY';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = MovieData.fromJson(responseDecoded);
    return item.movies;
  }
  throw Exception('Something Is Wrong');
}

Future<List<Movie>> getMoviesOfCast(int idCast) async {
  final String url = '$MAIN_URL/person/$idCast/movie_credits$API_KEY';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = MovieData.fromJson(responseDecoded);
    return item.movies;
  }
  throw Exception('Something Is Wrong');
}
