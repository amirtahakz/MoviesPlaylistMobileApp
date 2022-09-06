import 'package:http/http.dart' as http;
import 'package:moviesplaylist/models/cast.dart';
import 'dart:convert';
import 'package:moviesplaylist/models/cast_data.dart';
import 'package:moviesplaylist/models/profile.dart';

String MAIN_URL = 'https://api.themoviedb.org/3';
String API_KEY = '?api_key=16d9cee9ebd27d83a92eb4ef14b45c8c';

Future<List<Cast>> getTrendingCasts() async {
  final String url = '$MAIN_URL/trending/person/day$API_KEY';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = CastData.fromJsonResults(responseDecoded);
    return item.casts;
  }
  throw Exception('Something Is Wrong');
}

Future<List<Cast>> getCastsOfMovie(int idMovie) async {
  final String url = '$MAIN_URL/movie/$idMovie/casts$API_KEY';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = CastData.fromJsonCast(responseDecoded);
    return item.casts;
  }
  throw Exception('Something Is Wrong');
}

Future<List<Cast>> getCastsOfSerial(int idSerial) async {
  final String url = '$MAIN_URL/tv/$idSerial/credits$API_KEY';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = CastData.fromJsonCast(responseDecoded);
    return item.casts;
  }
  throw Exception('Something Is Wrong');
}

Future<CastData> getPopularCasts() async {
  final String url = '$MAIN_URL/person/popular$API_KEY&page=1';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = CastData.fromJsonResults(responseDecoded);
    return item;
  }
  throw Exception('Something Is Wrong');
}

Future<List<Cast>> getMorePopularCasts(int pageNum) async {
  final String url = '$MAIN_URL/person/popular$API_KEY&page=$pageNum';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = CastData.fromJsonResults(responseDecoded);
    return item.casts;
  }
  throw Exception('Something Is Wrong');
}

Future<Cast> getDetailsCast(int idCast) async {
  final String url = '$MAIN_URL/person/$idCast$API_KEY';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = Cast.fromJson(responseDecoded);
    return item;
  }
  throw Exception('Something Is Wrong');
}

Future<List<Profile>> getImagesOfCast(int idCast) async {
  final String url = '$MAIN_URL/person/$idCast/images$API_KEY';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = Cast.fromJson(responseDecoded);
    return item.profiles!;
  }
  throw Exception('Something Is Wrong');
}
