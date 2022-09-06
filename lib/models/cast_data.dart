import 'package:moviesplaylist/models/cast.dart';

class CastData{
  final List<Cast> casts;
  final int? total_pages;

  CastData({
    required this.casts,
    this.total_pages,
  });

  factory CastData.fromJsonResults(Map<String, dynamic> json) {
    final List<Cast> dataTemp = [];
    if (json['results'].length != 0) {
      json['results'].forEach((item) {
        dataTemp.add(Cast.fromJson(item as Map<String, dynamic>));
      });
    }
    return CastData(
      casts: dataTemp,
      total_pages: json['total_pages'],
    );
  }

  factory CastData.fromJsonCast(Map<String, dynamic> json) {
    final List<Cast> dataTemp = [];
    if (json['cast'].length != 0) {
      json['cast'].forEach((item) {
        dataTemp.add(Cast.fromJson(item as Map<String, dynamic>));
      });
    }
    return CastData(
      casts: dataTemp,
      total_pages: json['total_pages']
    );
  }

}