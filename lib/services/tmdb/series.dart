import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:moviesplaylist/models/serial.dart';
import 'package:moviesplaylist/models/serial_data.dart';

String MAIN_URL = 'https://api.themoviedb.org/3';
String API_KEY = '?api_key=16d9cee9ebd27d83a92eb4ef14b45c8c';

Future<List<Serial>> getSuggestedSerial(int idSerial) async {
  final String url = '$MAIN_URL/tv/$idSerial/recommendations$API_KEY';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = SerialData.fromJson(responseDecoded);
    return item.series;
  }
  throw Exception('Something Is Wrong');
}

Future<SerialData> getPopularSeries() async {
  final String url = '$MAIN_URL/tv/popular$API_KEY&page=1';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = SerialData.fromJson(responseDecoded);
    return item;
  }
  throw Exception('Something Is Wrong');
}

Future<List<Serial>> getMorePopularSeries(int pageNum) async {
  final String url = '$MAIN_URL/tv/popular$API_KEY&page=$pageNum';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = SerialData.fromJson(responseDecoded);
    return item.series;
  }
  throw Exception('Something Is Wrong');
}

Future<Serial> getDetailsSerial(int idSerial) async {
  final String url = '$MAIN_URL/tv/$idSerial$API_KEY';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = Serial.fromJson(responseDecoded);
    return item;
  }
  throw Exception('Something Is Wrong');
}

Future<List<Serial>> getSeriesOfCast(int idCast) async {
  final String url = '$MAIN_URL/person/$idCast/tv_credits$API_KEY';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final responseDecoded = jsonDecode(response.body);
    final item = SerialData.fromJson(responseDecoded);
    return item.series;
  }
  throw Exception('Something Is Wrong');
}
